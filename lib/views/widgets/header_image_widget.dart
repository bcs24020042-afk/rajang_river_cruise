import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  final String imageUrl;

  const HeaderImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      width: double.infinity,
      height: 190,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        height: 190,
        color: Colors.grey[300],
        child: const Center(
          child: Icon(Icons.image, size: 50),
        ),
      ),
    );
  }
}