import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../constants/fonts.dart';


PreferredSizeWidget appBarWidget(
  String titleText,
  BuildContext context, {
  String? result,
  Function(String)? onBackButtonPressed,
}) =>
    AppBar(
      backgroundColor: ColorName.whiteColor,
      elevation: 0.5,
      centerTitle: true,
      title: Text(
        titleText,
        style: semiBoldFont(ColorName.blackColor, 18),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context, result),
        icon: const Icon(
          Icons.arrow_back_ios_sharp,
          color: ColorName.strongBlueColor,
        ),
      ),
    );
