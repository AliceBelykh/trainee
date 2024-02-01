import 'package:flutter/material.dart';

// enum Status {
//   resolved, //0x4434C759
//   closed, //0x448E8E93
//   processing //0x44007AFF
// }

Map<String, int> status = {
  "Решен": 0x4434C759,
  "Закрыт": 0x448E8E93,
  "Принят в обработку": 0x44007AFF
};

class StatusTag extends StatelessWidget {
  final String appealStatus;

  const StatusTag({super.key,
    required this.appealStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(status[appealStatus] ?? 0x448E8E93),
          borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
      child: Text(
        appealStatus,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
