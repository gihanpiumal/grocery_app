import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/auth_controllers.dart';
import 'package:grocery_app/screens/auth/login.dart';
import 'package:grocery_app/utils/alert_helper.dart';
import 'package:logger/logger.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../components/custom_text_field.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets_constants.dart';
import '../../utils/util_functions.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  /// email controller
  final emailController = TextEditingController();

  /// password controller
  final passwordController = TextEditingController();

  /// name controller
  final nameController = TextEditingController();

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
                  height: 52,
                ),
                const CustomText(
                  text: 'SignUp',
                  textAlign: TextAlign.center,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  AssetConstants.logo,
                  width: 202,
                  height: 138,
                ),
                const SizedBox(
                  height: 39,
                ),
                CustomTextfield(
                  hintText: "Name",
                  controller: nameController,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextfield(
                  hintText: "Email",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextfield(
                  hintText: "Password",
                  isObscure: true,
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      UtilFunctions().navigateTo(context, const Login());
                    },
                    child: const CustomText(
                      text: 'Already have an account?',
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 29,
                ),
                CustomButton(
                  text: "SignUp",
                  isLoading: isLoading,
                  onTap: () async {
                    if (validationFields()) {
                      /// start the loader
                      setState(() {
                        isLoading = true;
                      });
                      await AuthController().registerUser(
                        context,
                        emailController.text,
                        passwordController.text,
                      );

                      /// clear text fields
                      emailController.clear();
                      nameController.clear();
                      passwordController.clear();

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
    if (emailController.text.isEmpty ||
        nameController.text.isEmpty ||
        passwordController.text.isEmpty) {
      /// show error dialog
      AlertHelper.showAlert(
          context, DialogType.ERROR, "ERROR", "Please fill all the fields!");
      return false;
    } else if (!emailController.text.contains("@")) {
      /// show error dialog
      AlertHelper.showAlert(
          context, DialogType.ERROR, "ERROR", "Please enter a valid email!");
      return false;
    } else if (passwordController.text.length < 6) {
      /// show error dialog
      AlertHelper.showAlert(context, DialogType.ERROR, "ERROR",
          "Password must contain at least 6 characters!");
      return false;
    } else {
      return true;
    }
  }
}
