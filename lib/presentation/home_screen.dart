import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee/appeals/presentation/appeals_page.dart';
import 'package:trainee/presentation/bloc/home_bloc.dart';
import 'package:trainee/appeals/data/appeal_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc(
          RepositoryProvider.of<AppealService>(context),
        )..add(RegisterServicesEvent()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              return const AppealsPage();
            }
            return Container();
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: const Color(0xFFD1D1D6),
        currentIndex: 2,
        items: const [
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
