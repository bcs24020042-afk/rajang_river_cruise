import 'package:flutter/material.dart';

class ActionBarWidget extends StatelessWidget {
  const ActionBarWidget({super.key});

  Widget _buildButton(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton(Icons.call, 'CALL', color),
        _buildButton(Icons.near_me, 'ROUTE', color),
        _buildButton(Icons.share, 'SHARE', color),
      ],
    );
  }
}