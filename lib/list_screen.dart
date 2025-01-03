import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'detail_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List _students = [];

  Future<void> _loadStudents() async {
    final prefs = await SharedPreferences.getInstance();
    String? studentData = prefs.getString('students');
    setState(() {
      _students = studentData != null ? jsonDecode(studentData) : [];
    });
  }

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student List')),
      body: ListView.builder(
        itemCount: _students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_students[index]['name']),
            subtitle: Text('GPA: ${_students[index]['gpa']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(student: _students[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
