import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../constants/fonts.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButton({
    super.key,
    required this.textButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ColorName.greenBlueColor,
            fixedSize: const Size(double.infinity, 41),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        child: Text(
          textButton,
          style: mediumFont(
            ColorName.whiteColor,
            14,
          ),
        ),
      ),
    );
  }
}
