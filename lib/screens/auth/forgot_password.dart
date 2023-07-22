import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../components/custom_text_field.dart';
import '../../controllers/auth_controllers.dart';
import '../../utils/alert_helper.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets_constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  /// email controller
  final emailController = TextEditingController();

  /// loader state
  bool isLoading = false;

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
                CustomTextfield(
                  hintText: "Email",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 53,
                ),
                CustomButton(
                  text: "Send reset email",
                  isLoading: isLoading,
                  onTap: () async {
                    if (validationFields()) {
                      /// start the loader
                      setState(() {
                        isLoading = true;
                      });
                      await AuthController().sendPasswordResetEmail(
                        context,
                        emailController.text,
                      );

                      /// clear text fields
                      emailController.clear();

                      /// stop the loader
                      setState(() {
                        isLoading = false;
                      });
                    } else {
                      Logger().e("valoidation failed");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// validate text field functions
  bool validationFields() {
    if (emailController.text.isEmpty) {
      /// show error dialog
      AlertHelper.showAlert(
          context, DialogType.ERROR, "ERROR", "Please fill email fields!");
      return false;
    } else if (!emailController.text.contains("@")) {
      /// show error dialog
      AlertHelper.showAlert(
          context, DialogType.ERROR, "ERROR", "Please enter a valid email!");
      return false;
    } else {
      return true;
    }
  }
}
