import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/routes/routes_name.dart';
import 'package:todo_list/view/auth/signin_screen.dart';

class Authcontroller extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController forgot = TextEditingController();

  RxBool isloading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future signup() async {
    if (formKey.currentState!.validate()) {
      try {
        isloading.value = true;
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        Get.toNamed(RouteNames.home);
      } catch (e) {
        Get.snackbar('Error', e.toString());
      } finally {
        isloading.value = false;
      }
    }
  }

  Future<void> signin(
    GlobalKey<FormState> _formKey,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    try {
      isloading.value = true;

      if (_formKey.currentState!.validate()) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        Get.toNamed(RouteNames.home);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password.';
          break;
        case 'invalid-email':
          errorMessage = 'The email format is invalid.';
          break;
        case 'user-disabled':
          errorMessage = 'This user has been disabled.';
          break;
        default:
          errorMessage = 'An error occurred. Please try again.';
      }

      Get.snackbar(
        'Login Failed',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong. ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isloading.value = false;
    }
  }

  // Future signin(
  //   GlobalKey<FormState> _formKey,
  //   TextEditingController emailController,
  //   TextEditingController PasswordController,
  // ) async {
  //   try {
  //     isloading.value = true;
  //     if (_formKey.currentState!.validate()) {
  //       await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailController.text,
  //         password: PasswordController.text,
  //       );
  //       Get.toNamed(RouteNames.home);
  //     }
  //   } catch (e) {
  //     Get.snackbar("error", e.toString());

  //   } finally {
  //     isloading.value = false;
  //   }
  // }

  Future Forgotpassword(GlobalKey<FormState> _formkey,
      TextEditingController emailcontroller) async {
    if (_formkey.currentState!.validate()) {
      try {
        isloading.value = true;

        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailcontroller.text.trim(),
        );

        Get.snackbar(
          "Success",
          "Password reset email sent successfully!",
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
        );

        Get.toNamed(RouteNames.signin);
      } catch (e) {
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        isloading.value = false;
      }
    }
  }
}
