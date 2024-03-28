import 'package:flutter/material.dart';
import 'package:trainee/presentation/widgets/status.dart';

class AppealTile extends StatelessWidget {
  final int appealNumber;
  final String appealStatus;
  final DateTime appealDate;
  final Function()? onTap;

  const AppealTile({
    super.key,
    required this.appealNumber,
    required this.appealStatus,
    required this.appealDate,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 0.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFFF5F4F2),
              borderRadius: BorderRadius.circular(18)),
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatusTag(appealStatus: appealStatus),
                  SizedBox(
                    child: Text(
                      "${appealDate.day}.${appealDate.month}.${appealDate.year}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFAEAEB2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    child: Text(
                      "Номер обращения:",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF181818)),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      appealNumber.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
