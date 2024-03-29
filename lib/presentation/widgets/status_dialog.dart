import 'package:flutter/material.dart';

class StatusDialog extends StatelessWidget {
  const StatusDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("Выберите статус обращения"),
      backgroundColor: const Color(0xFFF5F4F2),
      shadowColor: const Color(0xFF5856D6),
      surfaceTintColor: const Color.fromARGB(255, 128, 127, 125),
      children: [
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 'Решен');
          },
          child: const Text('Решен'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 'Закрыт');
          },
          child: const Text('Закрыт'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 'Принят в обработку');
          },
          child: const Text('Принят в обработку'),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context, 'Delete');
            },
            child: const Text('Удалить обращение')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Отмена'))
      ],
    );
  }
}
