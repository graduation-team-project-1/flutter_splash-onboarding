import 'package:app/core/resource/values_manage.dart';
import 'package:app/features/main/article/presentation/viewmodel/model/data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  final SharedPreferences _sharedPreferences;

  AppSharedPref(this._sharedPreferences);

  Future<void> saveData({required List<ItemModel> item}) async {
    await _sharedPreferences.setStringList(
      KeyValues.savedItemKey,
      item
          .map(
            (item) => item.toString(),
          )
          .toList(),
    );
  }

  Future<void> removeSaveData({required ItemModel item}) async {
    final data = _sharedPreferences.getStringList(KeyValues.savedItemKey) ?? [];
    // print("this is data before remove item $data");
    // print("*" * 20);
    data.remove(item.toString());
    // print("this is data after remove item $data");
    // for (var element in data) {
    //   // print(element);
    // }
  }

  Future<List<ItemModel>> getSaveData() async {
    List<ItemModel> dataSaved = [];
    final allValues =
        _sharedPreferences.getStringList(KeyValues.savedItemKey) ?? [];
    for (var element in allValues) {
      ItemModel changeItemType = element as ItemModel;
      dataSaved.add(changeItemType);
    }
    return dataSaved;
  }

  Future<void> setOnBoarding() async {
    _sharedPreferences.setBool(
      KeyValues.onBoardingItemKey,
      true,
    );
  }

  Future<bool> getOnBoarding() async {
    return _sharedPreferences.getBool(KeyValues.onBoardingItemKey) ?? false;
  }

  Future<void> saveNames(
      {required List<String> names, required String key}) async {
    await _sharedPreferences.setStringList(key, names);
  }

  Future<void> addName({required String name, required String key}) async {
    List<String> names = await getNames(key: key);
    if (!names.contains(name)) {
      names.add(name);
      await saveNames(names: names, key: key);
    }
  }

  Future<void> removeName({required String name, required String key}) async {
    List<String> names = await getNames(key: key);
    if (names.contains(name)) {
      names.remove(name);
      await saveNames(names: names, key: key);
    }
  }

  List<String> getNames({required String key})  {
    List<String> data =  _sharedPreferences.getStringList(key) ?? [];
    return data;
  }

  Future<void> clearAllData() async {
    await _sharedPreferences.clear();
  }
}
