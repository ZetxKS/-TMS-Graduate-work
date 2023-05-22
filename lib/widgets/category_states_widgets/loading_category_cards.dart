import 'package:flutter/material.dart';
class LoadingCategoryCards extends StatelessWidget {
  const LoadingCategoryCards({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}


