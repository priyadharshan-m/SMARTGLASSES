import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras[0],
      ResolutionPreset.medium,
    );

    await _cameraController.initialize();

    if (!mounted) return;

    setState(() {
      _isCameraInitialized = true;
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation System'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Welcome to the Navigation System!',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Start the navigation system
            },
            child: Text('Start'),
          ),
          SizedBox(height: 20),
          _isCameraInitialized
              ? AspectRatio(
                  aspectRatio: _cameraController.value.aspectRatio,
                  child: CameraPreview(_cameraController),
                )
              : Container(),
          SizedBox(height: 20),
          Text(
            'Output String',
            style: TextStyle(fontSize: 18),
          ),
          // Display the navigation system output string here
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Perform a specific action
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
