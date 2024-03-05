import 'package:app/features/auth/user%20data/view/widgets/choose_date.dart';
import 'package:app/features/auth/user%20data/viewModel/role_date/role_date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateRoleBody extends StatelessWidget {
  const DateRoleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoleDateCubit, RoleDateState>(
      builder: (context, state) {
        if (state is FirstDay) {
          return const ChooseTheDate("Start day of last period");
        } else if (state is EstimatedtDay) {
          return const ChooseTheDate("Estmaited due date");
        } else {
          return const ChooseTheDate("Date of Conception");
        }
      },
    );
  }
}
