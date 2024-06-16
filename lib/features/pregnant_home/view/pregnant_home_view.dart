import 'package:app/features/calender/cubits/events_cubit/events_cubit.dart';
import 'package:app/features/pregnant_home/view/widgets/pregnant_home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PregnantHomeView extends StatelessWidget {
  const PregnantHomeView({super.key,  this.isBoy});
  final bool? isBoy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => EventsCubit(),
        child:  PregnantHomeViewBody(isBoy: isBoy,),
      ),
    );
  }
}
