import 'package:ayurveda/model/login_model.dart';
import 'package:ayurveda/utilities/api_provider.dart';
import 'package:ayurveda/utilities/app_route.dart';
import 'package:ayurveda/utilities/com_binding.dart';
import 'package:ayurveda/utilities/session_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_utils/util/utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginBind implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final loginKey = GlobalKey<FormState>();

  LoginModelClass?loginModelClass;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var emailFocusNode = FocusNode();
  var passwordFocusNode = FocusNode();

  @override
  void onInit() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.onInit();
  }

  void postData(BuildContext context) async {
    cLog('This Worked---');
    if (loginKey.currentState?.validate() ?? false) {
      // cLog('User : ${emailController.text}');
      EasyLoading.show(status: 'loading...');
      loginModelClass = await Api.to.userLogin(
        userName: emailController.text,
        password: passwordController.text,
      );
      // cLog('User : ${emailController.text}');
      // print('the end......<testing>');
      EasyLoading.dismiss();
      // print('succes message is------------->${loginModel?.success}');
      if ((loginModelClass?.status ?? false)) {
        print('aaaaaaaaaaaaaaa1${loginModelClass?.message ?? ''}');
        AppSession.to.session.write(SessionKeys.TOKEN, loginModelClass?.token);
        print('token is=========>${AppSession.to.session.read(SessionKeys.TOKEN,)}');
        Get.toNamed(Routes.home);
      } else {
        print('aaaaaaaaaaaaaaa${loginModelClass?.message ?? ''}');
        EasyLoading.showToast('Invalid User Name or Password');
      }
    }
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