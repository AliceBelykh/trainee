import 'package:flutter/material.dart';

class StatusDialog extends StatelessWidget {
  const StatusDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("Выберите статус обращения"),
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
