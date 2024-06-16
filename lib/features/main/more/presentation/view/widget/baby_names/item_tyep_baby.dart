
import 'package:app/core/resource/color_manager.dart';
import 'package:app/features/main/more/data/model/item_type_baby_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemType extends StatelessWidget {
  const ItemType({
    required this.itemTypeBabyModel,
    super.key,
  });
  final ItemTypeBabyModel itemTypeBabyModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 240,
      decoration: itemTypeBabyModel.isSelected
          ? itemTypeBabyModel.title == "Boy"
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: ColorManager.boyBabybackGround,
                  border: Border.all(
                    color: ColorManager.boyBabyName,
                    width: 3,
                  ),
                )
              : itemTypeBabyModel.title == "Girl"
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorManager.girlBabybackGround,
                      border: Border.all(
                        color: ColorManager.girlBabyName,
                        width: 3,
                      ),
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorManager.faviourteBabybackGround,
                      border: Border.all(
                        color: ColorManager.faviourteBabyName,
                        width: 3,
                      ),
                    )
          : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            itemTypeBabyModel.itemImage,
            fit: BoxFit.scaleDown,
          ),
          // Text(
          //   itemTypeBabyModel.title,
          //   style: itemTypeBabyModel.style,
          // )
        ],
      ),
    );
  }
}
