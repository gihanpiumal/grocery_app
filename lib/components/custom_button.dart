import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 259,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8)),
        child: CustomText(
          text: text,
          fontSize: 18,
          color: AppColors.kWhite,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
