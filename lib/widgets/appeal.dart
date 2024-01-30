import 'package:flutter/material.dart';
import 'package:trainee/widgets/status_dialog.dart';

class AppealTile extends StatelessWidget {
  final int appealNumber;
  final String appealStatus;
  final DateTime appealDate;
  final Function(BuildContext)? editTapped;
  final Function(BuildContext)? deleteTapped;

  const AppealTile(
      {super.key,
      required this.appealNumber,
      required this.appealStatus,
      required this.appealDate,
      this.editTapped,
      this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 0.0),
      child: GestureDetector(
        onTap: (){showDialog(context: context,
            builder: (BuildContext context) {return StatusDialog();});},
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFFF5F4F2),
              borderRadius: BorderRadius.circular(18)),
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0x4434C759),
                        borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                    child: Text(
                      appealStatus,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                        "${appealDate.day}.${appealDate.month}.${appealDate.year}"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    child: Text(
                      "Номер обращения:",
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      appealNumber.toString(),
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
