
import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/dependency_injection.dart';
import 'package:app/core/resource/share_pref.dart';
import 'package:app/core/resource/values_manage.dart';
import 'package:app/features/main/more/data/local/baby_names_local.dart';
import 'package:app/features/main/more/presentation/viewmodel/cubit/save_baby_names_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BabyiesNamesValues extends StatefulWidget {
  const BabyiesNamesValues({
    super.key,
    required this.nameStratWith,
    required this.color,
  });
  final String nameStratWith;
  final Color? color;

  @override
  State<BabyiesNamesValues> createState() => _BabyiesNamesValuesState();
}

class _BabyiesNamesValuesState extends State<BabyiesNamesValues> {
  late AppSharedPref babyNamesPreferences;
  List<String> boyNames = [];
  List<String> girlNames = [];
  bool isBoyCategory = true; // Default to boy category

  @override
  void initState() {
    super.initState();
    babyNamesPreferences = instance.get();
    loadNames();
  }

  Future<void> loadNames() async {
    boyNames = await babyNamesPreferences.getNames(key: KeyValues.boyNamesKey);
    girlNames =
        await babyNamesPreferences.getNames(key: KeyValues.girlNamesKey);
    setState(() {});
  }

  Future<void> addName({required String name, required String key}) async {
    await babyNamesPreferences.addName(name: name, key: key);
    await loadNames();
  }

  Future<void> removeName({required String name, required String key}) async {
    await babyNamesPreferences.removeName(name: name, key: key);
    await loadNames();
  }

  final names = BabiesName();
  @override
  Widget build(BuildContext context) {
    // final babyNamiesList = BlocProvider.of<SaveBabyNamesCubit>(context);
    final List<String> values = names.getNames(
      nameStartWith: widget.nameStratWith,
      gender: widget.color == ColorManager.boyBabyName ? "Boy" : "Girl",
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: values
          .map(
            (item) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item,
                      style: TextStyle(
                        color: widget.color,
                      ),
                    ),
                    const Text(
                      "Fragrance or beautiful scent",
                      style: TextStyle(
                        color: ColorManager.babyDescriptionName,
                      ),
                    ),
                  ],
                ),
                widget.color == ColorManager.boyBabyName
                    ? IconButton(
                        onPressed: () {
                          print("item saved in list is $item");
                          if (boyNames.contains(item)) {
                            removeName(name: item, key: KeyValues.boyNamesKey);
                          } else {
                            addName(name: item, key: KeyValues.boyNamesKey);
                          }
                        },
                        icon:
                            BlocBuilder<SaveBabyNamesCubit, SaveBabyNamesState>(
                          builder: (context, state) {
                            if (boyNames.contains(item)) {
                              return SvgPicture.asset(IconsPath.boyLike);
                            } else {
                              return SvgPicture.asset(IconsPath.boyDisLike);
                            }
                          },
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          print("item saved in list is $item");
                          if (girlNames.contains(item)) {
                            removeName(name: item, key: KeyValues.girlNamesKey);
                          } else {
                            addName(name: item, key: KeyValues.girlNamesKey);
                          }
                        },
                        icon:
                            BlocBuilder<SaveBabyNamesCubit, SaveBabyNamesState>(
                          builder: (context, state) {
                            if (girlNames.contains(item)) {
                              return SvgPicture.asset(IconsPath.girlLike);
                            } else {
                              return SvgPicture.asset(IconsPath.girlDisLike);
                            }
                          },
                        ),
                      ),
              ],
            ),
          )
          .toList(),
    );
  }
}
