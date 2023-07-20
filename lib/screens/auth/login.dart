import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/screens/auth/forgot_password.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';
import 'package:grocery_app/utils/util_functions.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text_field.dart';
import '../../components/social_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  text: 'Login',
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
                const CustomTextfield(
                  hintText: "Email",
                ),
                const SizedBox(
                  height: 8,
                ),
                const CustomTextfield(
                  hintText: "Password",
                  isObscure: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => UtilFunctions()
                        .navigateTo(context, const ForgotPassword()),
                    child: const CustomText(
                      text: 'Forgot your password?',
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 29,
                ),
                CustomButton(
                  text: "Login",
                  onTap: () {},
                ),
                const SizedBox(
                  height: 23,
                ),
                const CustomText(
                  text: 'Or login with social account',
                  textAlign: TextAlign.center,
                  fontSize: 14,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      iconPath: AssetConstants.googleIcon,
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SocialButton(
                      iconPath: AssetConstants.facebookIcon,
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
