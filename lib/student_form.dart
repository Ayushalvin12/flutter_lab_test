import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'list_screen.dart';

class StudentFormScreen extends StatefulWidget {
  @override
  _StudentFormScreenState createState() => _StudentFormScreenState();
}

class _StudentFormScreenState extends State<StudentFormScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _gpaController = TextEditingController();

  Future<void> _addStudent() async {
    final prefs = await SharedPreferences.getInstance();
    String? studentData = prefs.getString('students');
    List students = studentData != null ? jsonDecode(studentData) : [];

    students.add({
      'name': _nameController.text,
      'age': _ageController.text,
      'gpa': _gpaController.text,
    });

    await prefs.setString('students', jsonEncode(students));

    _nameController.clear();
    _ageController.clear();
    _gpaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _gpaController,
              decoration: InputDecoration(labelText: 'GPA' ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addStudent,
              child: Text('Add Student'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListScreen()),
                );
              },
              child: Text('View Students'),
            ),
          ],
        ),
      ),
    );
  }
}
