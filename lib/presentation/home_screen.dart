import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee/domain/models/appeal.dart';
import 'package:trainee/domain/models/appeal_generator.dart';
import 'package:trainee/get_it.dart';
import 'package:trainee/presentation/cubit/appeals_cubit/appeals_cubit.dart';
import 'package:trainee/presentation/widgets/add_button.dart';
import 'package:trainee/presentation/widgets/appeal_tile.dart';
import 'package:trainee/presentation/widgets/status_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AppealCubit _appealCubit;

  @override
  void initState() {
    super.initState();

    _appealCubit = getIt.get<AppealCubit>();
  }

  @override
  void dispose() {
    _appealCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppealCubit>.value(
      value: _appealCubit,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 18.0, top: 100.0, right: 18.0),
          child: Column(
            children: [
              // title
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Обращения',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 18),

              // add button
              BlocBuilder<AppealCubit, AppealState>(
                  builder: (context, data) => AddButton(
                        onTap: () async {
                          final appeal = AppealGenerator().generateAppeal();
                          BlocProvider.of<AppealCubit>(context)
                              .addAppeal(appeal);
                        },
                        buttonText: "Создать обращение",
                      )),

              const SizedBox(height: 18),

              // appeals listview
              BlocSelector<AppealCubit, AppealState, List<Appeal>?>(
                selector: (state) => state.data,
                builder: (context, data) => Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final item = data![index];
                      return AppealTile(
                        appealNumber: item.appealNumber,
                        appealStatus: item.appealStatus,
                        appealDate: item.appealDate,
                        onTap: () => showAppealDialog(item, context),
                      );
                    },
                    itemCount: data?.length,
                  ),
                ),
              ),
            ],
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

  showAppealDialog(Appeal appeal, BuildContext context) async {
    await showDialog<String>(
        context: context,
        builder: (context) {
          return const StatusDialog();
        }).then((result) {
      if (result == "Delete") {
        BlocProvider.of<AppealCubit>(context).deleteAppeal(appeal);
      } else if (result != null) {
        BlocProvider.of<AppealCubit>(context).changeStatus(appeal, result);
      }
    });
  }
}
