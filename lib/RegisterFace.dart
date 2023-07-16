import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartglasses/ML/Recognition.dart';
import 'package:smartglasses/ML/Recognizer.dart';
import 'package:image/image.dart' as img;
import 'package:smartglasses/facialrecognition.dart';

class RegisterFace extends StatefulWidget {
  const RegisterFace({super.key});

  @override
  State<RegisterFace> createState() => _RegisterFaceState();
}

class _RegisterFaceState extends State<RegisterFace> {
  late ImagePicker imagePicker;
  File? _image;

  //todo declare face detector
  late FaceDetector faceDetector;
  late Recognizer recognizer;

  //todo declare face recognizer
  List<Face> faces = [];
  var image;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();

    //todo initialize face detector
    final options = FaceDetectorOptions();
    faceDetector = FaceDetector(options: options);

    //todo initialize face recognition
    recognizer = Recognizer();
  }

  chooseImage() async {
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
        doFaceDetection();
      }
    });
  }

  captureImage() async {
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _image = File(image.path);
        doFaceDetection();
      }
    });
  }

  TextEditingController textEditingController = TextEditingController();
  doFaceDetection() async {
    //TODO PASSING INPUT TO FACE DETECTOR AND GETTING DETECTED FACES
    InputImage inputImage = InputImage.fromFile(_image!);

    faces = await faceDetector.processImage(inputImage);
    print('NO OF FACES IN THE IMAGE = ${faces.length}');
    performFaceRecognition();
  }

  performFaceRecognition() async {
    // await recognizer.loadModel();

    image = await _image?.readAsBytes();
    image = await decodeImageFromList(image);

    for (Face face in faces) {
      num left = face.boundingBox.left < 0 ? 0 : face.boundingBox.left;

      num top = face.boundingBox.top < 0 ? 0 : face.boundingBox.top;

      num right = face.boundingBox.right > image.width
          ? image.width - 1
          : face.boundingBox.right;

      num bottom = face.boundingBox.bottom > image.height
          ? image.height - 1
          : face.boundingBox.bottom;

      num width = right - left;
      num height = bottom - top;

      File croppedFace = await FlutterNativeImage.cropImage(_image!.path,
          left.toInt(), top.toInt(), width.toInt(), height.toInt());

      var bytes = await croppedFace.readAsBytes();
      img.Image? imgFace = await img.decodeImage(bytes);
      Recognition recognition =
          recognizer.recognize(imgFace!, face.boundingBox);

      showFaceRegistrationDialogue(croppedFace, recognition);
    }

    setState(() {
      _image;
    });
    drawRectangleAroundFaces();
  }

  showFaceRegistrationDialogue(File cropedFace, Recognition recognition) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Face Registration", textAlign: TextAlign.center),
        alignment: Alignment.center,
        content: SizedBox(
          height: 340,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.file(
                cropedFace,
                width: 200,
                height: 200,
              ),
              SizedBox(
                width: 200,
                child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Enter Name")),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Face1.registered.putIfAbsent(
                        textEditingController.text, () => recognition);
                    textEditingController.text = "";
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Face Registered"),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue, minimumSize: const Size(200, 40)),
                  child: const Text("Register"))
            ],
          ),
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  //TODO DRAW RECTANGLES
  drawRectangleAroundFaces() async {
    // image = await _image?.readAsBytes();
    // image = await decodeImageFromList(image);
    print("${image.width} ${image.height}");
    setState(() {
      image;
      faces;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _image != null
              ? Container(
                  margin: const EdgeInsets.only(top: 100),
                  width: 300,
                  height: 300,
                  child: Image.file(_image!),
                )
              // ? Container(
              //     margin: const EdgeInsets.only(
              //         top: 60, left: 30, right: 30, bottom: 0),
              //     child: FittedBox(
              //       child: SizedBox(
              //         width: image.width.toDouble(),
              //         height: image.height.toDouble(),
              //         child: CustomPaint(
              //           painter:
              //               Facepainter(facesList: faces, imageFile: image),
              //         ),
              //       ),
              //     ),
              //   )
              : Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: Image.asset(
                    'images/fricon.jpg',
                    width: 300,
                    height: 300,
                  )),
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: Colors.black,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(200))),
                  child: InkWell(
                    onTap: () {
                      chooseImage();
                    },
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.image,
                        color: Colors.red,
                        size: 75,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.black,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(200))),
                  child: InkWell(
                    onTap: () {
                      captureImage();
                    },
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.camera,
                        color: Colors.red,
                        size: 75,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Facepainter extends CustomPainter {
  List<Face> facesList;
  dynamic imageFile;
  Facepainter({required this.facesList, @required this.imageFile});

  @override
  void paint(Canvas canvas, Size size) {
    if (imageFile != null) {
      canvas.drawImage(imageFile, Offset.zero, Paint());
    }

    Paint p = Paint();
    p.color = Colors.red;
    p.style = PaintingStyle.stroke;
    p.strokeWidth = 3;

    for (Face face in facesList) {
      canvas.drawRect(face.boundingBox, p);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
