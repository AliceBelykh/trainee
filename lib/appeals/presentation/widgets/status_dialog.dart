import 'package:flutter/material.dart';

class StatusDialog extends StatelessWidget {
  //final String buttonText;
  //final Function()? onTap;

  const StatusDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("Выберите статус обращения"),
      children: [
        SimpleDialogOption(onPressed: () {},
          child: const Text('Решен'),),
        SimpleDialogOption(onPressed: () {},
          child: const Text('Закрыт'),),
        SimpleDialogOption(onPressed: () {},
          child: const Text('Принят в обработку'),),
        TextButton(onPressed: () {}, child: Text('Удалить обращение')),
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text('Отмена'))
      ],
    );
  }
}
