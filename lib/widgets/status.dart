import 'package:flutter/material.dart';
import 'package:trainee/widgets/status_dialog.dart';

enum Status {
  resolved, //0x4434C759
  closed, //
  processing //
}

class StatusButton extends StatelessWidget {
  final String appealStatus;
  final Color statusColor;

  const StatusButton({super.key,
    required this.appealStatus, required this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: statusColor,
          borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
      child: Text(
        appealStatus,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
