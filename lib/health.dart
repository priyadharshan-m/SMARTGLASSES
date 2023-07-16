import 'package:flutter/material.dart';

class HealthReportPage extends StatefulWidget {
  const HealthReportPage({Key? key}) : super(key: key);

  @override
  _HealthReportPageState createState() => _HealthReportPageState();
}

class _HealthReportPageState extends State<HealthReportPage> {
  List<String> _medicalReports = [
    "Eye exam results",
    "Blood pressure readings",
    "Cholesterol levels",
    "Diabetes test results"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical Reports"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _medicalReports.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_medicalReports[index]),
            leading: Icon(Icons.file_copy),
            onTap: () {
              // Navigate to detail page for this medical report
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to screen to add a new medical report
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
