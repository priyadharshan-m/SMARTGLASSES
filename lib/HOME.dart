import 'package:flutter/material.dart';
import 'package:smartglasses/connectivity.dart';
import 'package:smartglasses/facialrecognition.dart';
// import 'package:smartglasses/facialrecognition.dart';
//import 'package:smartglasses/ImagePicker.dart';
import 'package:smartglasses/navigation.dart';
import 'package:smartglasses/profile.dart';
import 'package:smartglasses/texttospeech1.dart';
//import 'package:smartglasses/texttospeech2.dart';
// import 'package:smartglasses/texttospeech2.dart';

import 'health.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text("SMART GLASSES"),
            centerTitle: true,
            elevation: 10,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.person_off_outlined),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),
            ],
            backgroundColor: Colors.blue),
        body: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              InkWell(
                onTap: () {
                  print("THE CARD IS CLICKED");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Text1()));
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Card(
                    child: Column(children: [
                      SizedBox(height: 10),
                      Icon(
                        Icons.audiotrack,
                        color: Colors.black,
                        size: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "TEXT-TO-SPEECH",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    color: Colors.blue,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print("THE CARD IS CLICKED");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavigationPage()));
                },
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Card(
                    child: Column(children: [
                      SizedBox(height: 10),
                      Icon(
                        Icons.navigation,
                        color: Colors.black,
                        size: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "NAVIGATION",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    color: Colors.blue,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Face1()));
                },
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Card(
                    child: Column(children: [
                      SizedBox(height: 10),
                      Icon(
                        Icons.face_outlined,
                        color: Colors.black,
                        size: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "FACIAL-RECOGNITION",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    color: Colors.blue,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Card(
                    child: Column(children: [
                      SizedBox(height: 10),
                      Icon(
                        Icons.emergency,
                        color: Colors.black,
                        size: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "SoS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    color: Colors.blue,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print("THE CARD IS CLICKED");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Card(
                    child: Column(children: [
                      SizedBox(height: 10),
                      Icon(
                        Icons.private_connectivity,
                        color: Colors.black,
                        size: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "CUSTOMIZATION-SETTINGS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    color: Colors.blue,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print("THE CARD IS CLICKED");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HealthReportPage()));
                },
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Card(
                    child: Column(children: [
                      const SizedBox(height: 10),
                      Icon(
                        Icons.health_and_safety,
                        color: Colors.black,
                        size: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "HEALTH",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    color: Colors.blue,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
