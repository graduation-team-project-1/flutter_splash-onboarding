import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/features/main/more/data/model/item_type_baby_model.dart';
import 'package:app/features/main/more/presentation/view/widget/baby_names/item_tyep_baby.dart';
import 'package:flutter/material.dart';

List<ItemType> listItems({
  required bool itemValue,
}) {
  final List<ItemType> items = [
    ItemType(
      itemTypeBabyModel: ItemTypeBabyModel(
        itemImage: ImagesPath.boyBabyName,
        title: "Boy",
        style: const TextStyle(color: ColorManager.boyBabyName, fontSize: 20),
        isSelected: itemValue,
      ),
    ),
    ItemType(
      itemTypeBabyModel: ItemTypeBabyModel(
        itemImage: ImagesPath.girlBabyName,
        title: "Girl",
        style: const TextStyle(color: ColorManager.girlBabyName, fontSize: 20),
        isSelected: itemValue,
      ),
    ),
    ItemType(
      itemTypeBabyModel: ItemTypeBabyModel(
        itemImage: ImagesPath.favioBabyName,
        title: "Favourite",
        style: const TextStyle(
            color: ColorManager.faviourteBabyName, fontSize: 20),
        isSelected: itemValue,
      ),
    ),
  ];

  return items;
}
