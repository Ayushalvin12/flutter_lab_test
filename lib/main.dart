import 'package:flutter/material.dart';
import 'student_form.dart';

void main() => runApp(StudentApp());

class StudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Student App',
      home: StudentFormScreen(),
    );
  }
}
