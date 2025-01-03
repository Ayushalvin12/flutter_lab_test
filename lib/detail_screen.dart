import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map student;

  DetailScreen({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${student['name']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Age: ${student['age']}', style: TextStyle(fontSize: 18)),
            SizedBox(height:8),
            Text('GPA: ${student['gpa']}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
