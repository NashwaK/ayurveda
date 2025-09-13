import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginBind implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var emailFocusNode = FocusNode();
  var passwordFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Minimum 6 characters required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required ';
    }
    if (!value.contains('@')) {
      return 'Enter a valid email';
    }
    return null;
  }
}