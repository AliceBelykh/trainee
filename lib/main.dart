import 'package:flutter/material.dart';
import 'package:trainee/Widgets/appeal.dart';
import 'package:trainee/appeals_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class TestWidgetPage extends StatefulWidget {
  const TestWidgetPage({super.key, required this.title});

  final String title;

  @override
  State<TestWidgetPage> createState() => _MyTestWidgetPageState();
}

class _MyTestWidgetPageState extends State<TestWidgetPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: AppealTile(appealNumber: 1234567890, appealStatus: "Решен", appealDate: DateTime.now(),)
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
