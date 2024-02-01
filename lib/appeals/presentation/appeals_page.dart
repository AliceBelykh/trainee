import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee/appeals/data/appeal_service.dart';
import 'package:trainee/appeals/domain/appeal_generator.dart';
import 'package:trainee/appeals/presentation/widgets/status_dialog.dart';
import 'bloc/appeal_bloc.dart';
import 'package:trainee/appeals/presentation/widgets/add_button.dart';

import 'widgets/appeal_tile.dart';

class AppealsPage extends StatelessWidget {
  const AppealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppealsBloc(RepositoryProvider.of<AppealService>(context))
            ..add(const LoadAppeals()),
      child: Padding(
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
            BlocBuilder<AppealsBloc, AppealsState>(
              builder: (context, state) {
                return AddButton(
                  onTap: () async {
                    final appeal = AppealGenerator().generateAppeal();
                    BlocProvider.of<AppealsBloc>(context)
                        .add(AddAppeal(appeal));
                  },
                  buttonText: "Создать обращение",
                );
              },
            ),
            const SizedBox(height: 18),
            BlocBuilder<AppealsBloc, AppealsState>(
              builder: (context, state) {
                if (state is AppealsLoaded) {
                  return Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: state.appeals
                          .map(
                            (e) => AppealTile(
                              onTap: () async {
                                await showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const StatusDialog();
                                    }).then((result) {
                                  if (result == "Delete") {
                                    BlocProvider.of<AppealsBloc>(context)
                                        .add(RemoveAppeal(e));
                                  } else if (result != null) {
                                    BlocProvider.of<AppealsBloc>(context)
                                        .add(ChangeStatus(e, result));
                                  }
                                });
                              },
                              appealNumber: e.appealNumber,
                              appealStatus: e.appealStatus,
                              appealDate: e.appealDate,
                            ),
                          )
                          .toList(),
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
