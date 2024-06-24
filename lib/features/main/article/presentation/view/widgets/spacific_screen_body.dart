import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/core/resource/values_manage.dart';
import 'package:app/features/main/article/presentation/view/details_screen.dart';
import 'package:app/features/main/article/presentation/viewmodel/cubits/saved_unsaved/saved_unsaved_cubit.dart';
import 'package:app/features/main/article/presentation/viewmodel/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart%20';

class SpacificScreenBody extends StatelessWidget {
  const SpacificScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedUnsavedCubit, SavedUnsavedState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: mainList.length,
          itemBuilder: (context, index) {
            final item = mainList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SpacificCardItem(item: item),
            );
          },
        );
      },
    );
  }
}

class SpacificCardItem extends StatelessWidget {
  const SpacificCardItem({
    super.key,
    required this.item,
  });

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          DetailsScreen(itemModel: item),
        );
      },
      child: Card(
        elevation: 8,
        child: Column(
          children: [
            Image.asset(item.image),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpacificScreenRow(
                    item: item,
                  ),
                  Text(
                    item.description,
                    style: Styles.robotoTextStyle12,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SpacificScreenRow extends StatelessWidget {
  const SpacificScreenRow({
    super.key,
    required this.item,
  });

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = BlocProvider.of<SavedUnsavedCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                item.title,
                style: Styles.robotoTextStyle16
                    .copyWith(color: ColorManager.mainColor),
                maxLines: 2,
                softWrap: true,
              ),
            ),
            IconButton(
              onPressed: () {
                if (favoriteCubit.favorites.contains(item)) {
                  favoriteCubit.removeFromFavorites(item);
                  print(
                      "this is length for array ${favoriteCubit.favorites.length}");
                } else {
                  favoriteCubit.addToFavorites(item);
                  print(
                      "this is length for array ${favoriteCubit.favorites.length}");
                }
              },
              icon: BlocBuilder<SavedUnsavedCubit, SavedUnsavedState>(
                builder: (context, state) {
                  if (favoriteCubit.favorites.contains(item)) {
                    return SvgPicture.asset(ImagesPath.saved);
                  } else {
                    return SvgPicture.asset(ImagesPath.unSaved);
                  }
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
