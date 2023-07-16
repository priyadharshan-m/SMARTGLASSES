import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RecFace extends StatefulWidget {
  const RecFace({super.key});

  @override
  State<RecFace> createState() => _RecFaceState();
}

class _RecFaceState extends State<RecFace> {
  late ImagePicker imagePicker;
  File? _image;
  //todo declare face detector
  //todo declare face recognizer

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
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

  doFaceDetection() async {}

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
