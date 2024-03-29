import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainee/presentation/home_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.wixMadeforDisplayTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5856D6),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
