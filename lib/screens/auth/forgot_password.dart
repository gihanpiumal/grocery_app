import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../components/custom_text_field.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets_constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 96,
                ),
                const CustomText(
                  text: 'Forgot Password',
                  textAlign: TextAlign.center,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(
                  height: 41,
                ),
                Image.asset(
                  AssetConstants.logo,
                  width: 202,
                  height: 138,
                ),
                const SizedBox(
                  height: 100,
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text:
                        'Please, enter your email address. You will receive a link to create a new password via email.',
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomTextfield(
                  hintText: "Email",
                ),
                const SizedBox(
                  height: 53,
                ),
                CustomButton(
                  text: "Send",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
