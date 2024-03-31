
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/auth/user%20data/view/date_role.dart';
import 'package:app/features/auth/user%20data/viewModel/role_date/role_date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as get_value;


class ConceptionSection extends StatelessWidget {
  const ConceptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      child: CustomButton(
        buttonTitle: "Date of conception",
        onPressed: () {
          BlocProvider.of<RoleDateCubit>(context).setRoleValue(value: "con");
          get_value.Get.to(
            const DateRole(),
          );
        },
        fontSize: 16,
      ),
    );
  }
}
