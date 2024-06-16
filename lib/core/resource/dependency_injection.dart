import 'package:app/core/resource/share_pref.dart';
import 'package:app/features/main/more/presentation/viewmodel/cubit/save_baby_names_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> appDI() async {
  final sharedPrefInstance = await SharedPreferences.getInstance();
  instance.registerSingleton<AppSharedPref>(
    AppSharedPref(
      sharedPrefInstance,
    ),
  );
   
}
