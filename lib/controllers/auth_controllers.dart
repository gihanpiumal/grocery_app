import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/auth/signup.dart';
import 'package:grocery_app/screens/main/main_screen.dart';
import 'package:grocery_app/utils/util_functions.dart';

import '../utils/alert_helper.dart';

class AuthController {
  /// firebase auth instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  /// signup function
  Future<void> registerUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      /// send email password to the firebase and create a user
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        /// check if the user credential object user not null
        if (value.user != null) {
          /// if user create successfully show alert
          AlertHelper.showAlert(context, DialogType.SUCCES, "SUCCESS",
              "User created successfully!");
        }
      });
    } on FirebaseAuthException catch (e) {
      /// show error dialog
      AlertHelper.showAlert(context, DialogType.ERROR, "ERROR", e.code);
    } catch (e) {
      /// show error dialog
      AlertHelper.showAlert(context, DialogType.ERROR, "ERROR", e.toString());
    }
  }

  /// signin function
  Future<void> signinUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      /// send email password to the firebase and check is user is exsists or not
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      /// show error dialog
      AlertHelper.showAlert(context, DialogType.ERROR, "ERROR", e.code);
    } catch (e) {
      /// show error dialog
      AlertHelper.showAlert(context, DialogType.ERROR, "ERROR", e.toString());
    }
  }

  /// initialize and check whether the user is signin or not
  Future<void> initializeUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        UtilFunctions().navigateTo(context, const Signup());
      } else {
        UtilFunctions().navigateTo(context, const MainScreen());
      }
    });
  }

  /// signout function
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  /// send password reset email
  Future<void> sendPasswordResetEmail(
      BuildContext context, String email) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((value) {
      /// show infor msg
      AlertHelper.showAlert(
          context, DialogType.INFO, "Email sent", "Please check your email!");
    });
  }
}
