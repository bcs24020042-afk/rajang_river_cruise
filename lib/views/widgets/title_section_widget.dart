import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  final String title;
  final String location;
  final int starCount;
  final bool isStarred;
  final VoidCallback onStarTapped;

  const TitleSectionWidget({
    super.key,
    required this.title,
    required this.location,
    required this.starCount,
    required this.isStarred,
    required this.onStarTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              isStarred ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
            onPressed: onStarTapped,
          ),
          Text('$starCount'),
        ],
      ),
    );
  }
}