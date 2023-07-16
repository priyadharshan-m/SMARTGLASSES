import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class Text1 extends StatefulWidget {
  const Text1({super.key});

  @override
  State<Text1> createState() => _Text1State();
}

class _Text1State extends State<Text1> {
  File? _selectedImage;
  String _output = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEXT TO SPEECH'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
                height: 150,
                width: 300,
                color: Colors.grey,
                child: (_selectedImage != null)
                    ? Image.file(_selectedImage!)
                    : Container()),
            SizedBox(
              height: 10,
            ),
            CustomButton(
                title: 'PICK FROM GALLERY',
                icon: Icons.browse_gallery,
                onclick: () => _getimage(ImageSource.gallery)),
            SizedBox(
              height: 10,
            ),
            CustomButton(
                title: 'PICK FROM CAMERA',
                icon: Icons.camera,
                onclick: () => _getimage(ImageSource.camera)),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 30,
              width: 300,
              child: ElevatedButton(
                  onPressed: () => _getString(),
                  child: Row(
                    children: [
                      Icon(Icons.audio_file),
                      SizedBox(
                        width: 10,
                      ),
                      Text('CONVERT TO AUDIO')
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: 200,
                  width: 300,
                  child: Text(_output),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _getString() async {
    if (_selectedImage != null) {
      final inputImage = InputImage.fromFile(_selectedImage!);
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);

      RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      setState(() {
        _output = recognizedText.text;
      });
    }
  }

  Future<void> _getimage(ImageSource source) async {
    final image = ImagePicker();
    final pickedImage = await image.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required Future<void> Function() onclick,
}) {
  return Container(
    height: 30,
    width: 300,
    child: ElevatedButton(
        onPressed: () => onclick(),
        child: Row(children: [
          Icon(icon),
          const SizedBox(
            width: 5,
          ),
          Text(title),
        ])),
  );
}
