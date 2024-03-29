import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee/domain/models/appeal.dart';
import 'package:trainee/get_it.dart';
import 'package:trainee/presentation/cubit/appeals_cubit/appeals_cubit.dart';
import 'package:trainee/presentation/widgets/appeal_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AppealCubit _AppealCubit;

  @override
  void initState() {
    super.initState();

    _AppealCubit = getIt.get<AppealCubit>();
  }

  @override
  void dispose() {
    _AppealCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppealCubit>.value(
      value: _AppealCubit,
      child: Scaffold(
        body: BlocSelector<AppealCubit, AppealState, List<Appeal>?>(
          selector: (state) => state.data,
          builder: (context, data) => ListView.builder(
            itemBuilder: (context, index) {
              final item = data![index];
              return AppealTile(
                appealNumber: item.appealNumber,
                appealStatus: item.appealStatus,
                appealDate: item.appealDate,
              );
            },
            itemCount: data?.length,
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
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({super.key});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, top: 100.0, right: 18.0),
      child: Column(
        children: <Widget>[
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Обращения',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 18),
          // BlocBuilder<AppealsBloc, AppealsState>(
          //   builder: (context, state) {
          //     return AddButton(
          //       onTap: () async {
          //         final appeal = AppealGenerator().generateAppeal();
          //         BlocProvider.of<AppealsBloc>(context)
          //             .add(AddAppeal(appeal));
          //       },
          //       buttonText: "Создать обращение",
          //     );
          //   },
          // ),
          const SizedBox(height: 18),
          // BlocBuilder<AppealsBloc, AppealsState>(
          //   builder: (context, state) {
          //     if (state is AppealsLoaded) {
          //       return Expanded(
          //         child: ListView(
          //           padding: EdgeInsets.zero,
          //           children: state.appeals
          //               .map(
          //                 (e) => AppealTile(
          //                   onTap: () async {
          //                     await showDialog<String>(
          //                         context: context,
          //                         builder: (BuildContext context) {
          //                           return const StatusDialog();
          //                         }).then((result) {
          //                       if (result == "Delete") {
          //                         BlocProvider.of<AppealsBloc>(context)
          //                             .add(RemoveAppeal(e));
          //                       } else if (result != null) {
          //                         BlocProvider.of<AppealsBloc>(context)
          //                             .add(ChangeStatus(e, result));
          //                       }
          //                     });
          //                   },
          //                   appealNumber: e.appealNumber,
          //                   appealStatus: e.appealStatus,
          //                   appealDate: e.appealDate,
          //                 ),
          //               )
          //               .toList(),
          //         ),
          //       );
          //     }
          //     return Container();
          //   },
          // ),
        ],
      ),
    );
  }
}
