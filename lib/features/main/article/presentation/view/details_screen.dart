import 'package:app/core/resource/assets.dart';
import 'package:app/features/main/article/presentation/view/widgets/spacific_screen_body.dart';
import 'package:app/features/main/article/presentation/viewmodel/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart%20';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.itemModel,
  });
  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: SvgPicture.asset(
            ImagesPath.arrowBack,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: DetailsScreenBody(
        itemModel: itemModel,
      ),
    );
  }
}

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({
    super.key,
    required this.itemModel,
  });
  final ItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10,),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(itemModel.image,fit: BoxFit.fill,width: double.maxFinite,),
            SpacificScreenRow(
              item: itemModel,
            ),
            Text(itemModel.description)
          ],
        ),
      ),
    );
  }
}
