import 'package:flutter/material.dart';
import 'package:smartglasses/RecognizeFace.dart';

// import 'package:smartglasses/RegisterFace.dart';
import 'package:smartglasses/registerFace1.dart';
import 'ML/Recognition.dart';
import 'RegisterFace.dart';

class Face1 extends StatefulWidget {
  const Face1({super.key});
  static Map<String, Recognition> registered = Map();
  @override
  State<Face1> createState() => _Face1State();
}

class _Face1State extends State<Face1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('REGISTER FACES'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  'images/fricon.jpg',
                  width: 300,
                  height: 300,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterFace()));
                    },
                    child: Text('REGISTER FACES')),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 250,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RecFace()));
                    },
                    child: Text('RECOGNIZE FACES')),
              ),
            ],
          ),
        ));
  }
}
