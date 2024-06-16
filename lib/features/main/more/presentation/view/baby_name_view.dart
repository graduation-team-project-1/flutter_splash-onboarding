import 'package:app/core/resource/dependency_injection.dart';
import 'package:app/core/resource/share_pref.dart';
import 'package:app/core/resource/values_manage.dart';
import 'package:app/features/main/more/presentation/view/widget/baby_names/baby_items_values.dart';
import 'package:app/features/main/more/presentation/view/widget/baby_names/favourite_names_values.dart';
import 'package:app/features/main/more/presentation/view/widget/baby_names/item_taps_app_bar.dart';
import 'package:app/features/main/more/presentation/viewmodel/cubit/save_baby_names_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BabyNameScreenView extends StatelessWidget {
  const BabyNameScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: SaveBabyNamesCubit(
        instance.get(),
      ),
      child: BabyNameScreen(),
    );
  }
}

class BabyNameScreen extends StatefulWidget {
  const BabyNameScreen({super.key});

  @override
  State<BabyNameScreen> createState() => _BabyNameScreenState();
}

class _BabyNameScreenState extends State<BabyNameScreen> {
  final AppSharedPref appSharedPref = instance.get();

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  int _currentIndex = 0;

  void onTap(newValue) {
    setState(() {
      _currentIndex = newValue;
    });
  }

  List<String> namesFromShared({required String key}) {
    final data = appSharedPref.getNames(key: key);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: itemTaps(currentIndex: _currentIndex, onTap: onTap),
        body: _currentIndex == 0 || _currentIndex == 1
            ? BabyNameTitlesItems(
                index: _currentIndex,
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    FavoriteNames(
                      babyGender: "Boy",
                      names: namesFromShared(key: KeyValues.boyNamesKey),
                    ),
                    FavoriteNames(
                      babyGender: "Girl",
                      names: namesFromShared(key: KeyValues.girlNamesKey),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
