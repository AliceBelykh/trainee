import 'package:flutter/material.dart';
import 'package:trainee/domain/models/statuses.dart';

class StatusTag extends StatelessWidget {
  final String appealStatus;

  const StatusTag({super.key, required this.appealStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(statusesMap[appealStatus] ?? 0x448E8E93),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
      child: Text(
        appealStatus,
        style: TextStyle(
          fontSize: 13,
          color:
              Color(statusesMap[appealStatus] ?? 0x448E8E93).withOpacity(1.0),
        ),
      ),
    );
  }
}
