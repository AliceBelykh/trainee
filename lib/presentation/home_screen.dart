import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    // return BlocProvider<HomeBloc,HomeState>(
    //   child: Scaffold(
    //     appBar: HomeScreenAppBar(),
    //     body: Body(),
    //   ),
    // );
  }
}