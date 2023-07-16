import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              CircleAvatar(
                radius: 60,
                child: Text(
                  'AB',
                  style: TextStyle(fontSize: 50),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '@xyz',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Age: 25',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Gender: Male',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              ListTile(
                leading: Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: const Text('Edit Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: const Text('About Us'),
                onTap: () {},
              ),
            ],
          ),
        ));
  }
}
