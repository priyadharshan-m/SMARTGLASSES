import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _obstacleDetectionEnabled = true;
  double _volume = 0.5;
  double _speed = 0.5;
  bool _FacialDetectionEnabled = true;
  double _fvolume = 0.5;
  double _fspeed = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OBSTACLE DETECTION',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Enabled',
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: _obstacleDetectionEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _obstacleDetectionEnabled = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Volume',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Slider(
              value: _volume,
              onChanged: (double value) {
                setState(() {
                  _volume = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Speed',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Slider(
              value: _speed,
              onChanged: (double value) {
                setState(() {
                  _speed = value;
                });
              },
            ),
            Text(
              'FACIAL DETECTION',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Enabled',
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: _FacialDetectionEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _FacialDetectionEnabled = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Volume',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Slider(
              value: _fvolume,
              onChanged: (double value) {
                setState(() {
                  _fvolume = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Speed',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Slider(
              value: _fspeed,
              onChanged: (double value) {
                setState(() {
                  _fspeed = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
