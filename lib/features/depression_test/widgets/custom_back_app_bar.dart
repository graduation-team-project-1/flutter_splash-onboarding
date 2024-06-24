import 'package:flutter/material.dart';

class CustomBackAppBar extends StatelessWidget {
  const CustomBackAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const Icon(
        Icons.arrow_back_ios_rounded,
      ),
    );
  }
}
