import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/space_widget.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/paymants_view_header.dart';
import 'package:app/features/pregnant_home/presentation/view/widgets/paymants_view_items_group.dart';
import 'package:flutter/material.dart';

class PaymantsView extends StatelessWidget {
  const PaymantsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const PaymantsViewHeader(),
          const VerticalSpace(8),
          const PaymantsViewItemsGroup(),
          const VerticalSpace(6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CustomButton(
                buttonTitle: StringManager.tryFreeSubsribe, onPressed: () {}),
          )
        ],
      ),
    );
  }
}
