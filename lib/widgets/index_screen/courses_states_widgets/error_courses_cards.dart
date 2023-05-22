import 'package:flutter/cupertino.dart';

class ErrorCoursesCards extends StatelessWidget {
  final String error;
  const ErrorCoursesCards({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Text(error);
  }
}