import 'package:flutter/material.dart';
import 'package:trainee/Widgets/appeal.dart';
import 'package:trainee/model/appeal.dart';
import 'package:trainee/widgets/add_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Appeal> appeals = [
    Appeal(1234567890, "Решен", DateTime.now()),
    Appeal(1203567890, "Закрыт", DateTime.now()),
    Appeal(0455897890, "Принят в обработку", DateTime.now()),
    Appeal(1234567890, "Решен", DateTime.now()),
    Appeal(1203567890, "Закрыт", DateTime.now()),
    Appeal(0455897890, "Принят в обработку", DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, top: 100.0, right: 18.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: const Text(
                'Обращения',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            AppealButton(onTap: (){}, buttonText: "Создать обращение",),
            Expanded(
              child: ListView.builder(
                  itemCount: appeals.length,
                    itemBuilder: (context, index) {
                    return AppealTile(appealNumber: appeals[index].appealNumber,
                      appealDate: appeals[index].appealDate,
                      appealStatus: appeals[index].appealStatus,);
                    }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Счета"),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on), label: "Оплата"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded), label: "Обращения"),
        ],
      ),
    );
  }
}
