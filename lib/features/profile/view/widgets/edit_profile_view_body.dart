import 'dart:io';

import 'package:app/core/resource/assets.dart';
import 'package:app/core/resource/color_manager.dart';
import 'package:app/core/resource/font_manager.dart';
import 'package:app/core/resource/size_config.dart';
import 'package:app/core/resource/string_manage.dart';
import 'package:app/core/resource/styles.dart';
import 'package:app/features/profile/view/widgets/edit_profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({Key? key}) : super(key: key);

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  late String selectedImage;

  @override
  void initState() {
    super.initState();
    selectedImage = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: EditProfileForm(
              onTab: selectImage,
              child: buildImageStack(),
            )));
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: buildBackButton(),
      title: buildAppBarTitle(),
      centerTitle: true,
    );
  }

  GestureDetector buildBackButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios_rounded,
        color: ColorManager.mainColor,
      ),
    );
  }

  Text buildAppBarTitle() {
    return Text(
      StringManager.editProfile,
      style: Styles.textStyle20.copyWith(
        color: ColorManager.mainColor,
        fontFamily: FontType.kRoboto,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Stack buildImageStack() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        buildImageContainer(),
        buildCameraIcon(),
      ],
    );
  }

  Center buildImageContainer() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defultSize! / 5),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorManager.mainColor,
        ),
        child: Container(
          padding: EdgeInsets.all(SizeConfig.defultSize! / 3),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.whiteColor,
          ),
          child: buildAvatar(),
        ),
      ),
    );
  }

  Positioned buildCameraIcon() {
    return Positioned(
      bottom: SizeConfig.defultSize! / 2,
      right: SizeConfig.defultSize! / .07,
      child: Transform.scale(
        scale: SizeConfig.defultSize! * .14,
        child: SvgPicture.asset(
          ImagesPath.cameraIcon,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  CircleAvatar buildAvatar() {
    return CircleAvatar(
      radius: SizeConfig.defultSize! * 7,
      backgroundImage: selectedImage == ''
          ? const AssetImage(ImagesPath.testImage)
          : Image.file(File(selectedImage)).image,
    );
  }

  Future<void> selectImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return buildImageAlertDialog();
      },
    );
  }

  AlertDialog buildImageAlertDialog() {
    return AlertDialog(
      shadowColor: ColorManager.shadowColor,
      backgroundColor: ColorManager.mainColor,
      title: const Text(
        StringManager.selectImageFrom,
        textAlign: TextAlign.center,
        style: TextStyle(color: ColorManager.whiteColor),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          buildChooseCameraButton(),
          const Spacer(),
          buildChooseGalleryButton(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget buildChooseCameraButton() {
    return buildChooseButton(
      onPressed: () async {
        selectedImage = await selectImageFromCamera();
        handleImageSelection();
      },
      icon: Icons.add_a_photo_rounded,
    );
  }

  Widget buildChooseGalleryButton() {
    return buildChooseButton(
      onPressed: () async {
        selectedImage = await selectImageFromGallery();
        handleImageSelection();
      },
      icon: Icons.perm_media_rounded,
    );
  }

  Widget buildChooseButton(
      {required VoidCallback onPressed, required IconData icon}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: ColorManager.whiteColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 1.5 * SizeConfig.defultSize!,
            horizontal: 2 * SizeConfig.defultSize!,
          ),
          child: Icon(
            icon,
            color: ColorManager.mainColor,
            size: SizeConfig.defultSize! * 5,
          ),
        ),
      ),
    );
  }

  Future<String> selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    return file?.path ?? '';
  }

  Future<String> selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    return file?.path ?? '';
  }

  void handleImageSelection() {
    if (selectedImage.isNotEmpty) {
      print("Selected Image: $selectedImage");
      Navigator.pop(context);
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(StringManager.noImageSelected)));
    }
  }
}
