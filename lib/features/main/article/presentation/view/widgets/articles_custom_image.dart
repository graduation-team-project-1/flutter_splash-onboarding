
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  const CustomImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 250,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
