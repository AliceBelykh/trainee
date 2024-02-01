import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee/appeals/data/appeal_service.dart';
import 'bloc/appeal_bloc.dart';
import 'package:trainee/appeals/presentation/widgets/add_button.dart';

import 'widgets/appeal.dart';

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
            AddButton(
              onTap: () {},
              buttonText: "Создать обращение",
            ),
            BlocBuilder<AppealsBloc, AppealsState>(
              builder: (context, state) {
                if (state is AppealsLoaded) {
                  return Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: state.appeals
                          .map((e) => AppealTile(
                              appealNumber: e.appealNumber,
                              appealStatus: e.appealStatus,
                              appealDate: e.appealDate))
                          .toList(),
                    ),
                  );
                  //   Expanded(
                  //   child: ListView.builder(
                  //     padding: EdgeInsets.zero,
                  //     itemCount: appeals.length,
                  //     itemBuilder: (context, index) {
                  //       return AppealTile(
                  //         appealNumber: appeals[index].appealNumber,
                  //         appealDate: appeals[index].appealDate,
                  //         appealStatus: appeals[index].appealStatus,
                  //       );
                  //     },
                  //   ),
                  // );
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
