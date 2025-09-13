import 'package:ayurveda/res/colors.dart';
import 'package:ayurveda/res/images.dart';
import 'package:ayurveda/ui/login/bind/login_bind.dart';
import 'package:ayurveda/ui/login/view/more.dart';
import 'package:ayurveda/utilities/app_route.dart';
import 'package:ayurveda/utilities/common_textfield.dart';
import 'package:ayurveda/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder: (logic) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: context.cHeight * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(backgroundImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Image.asset(logo,height: 50,),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FirstPart(),
                    CustomizedTextFieldGreyBg(
                      controller: logic.emailController,
                      hintText: 'Enter your email',
                      focusNode: logic.emailFocusNode,
                      nextFocusNode: logic.passwordFocusNode,
                      validator: logic.validateEmail,
                    ).cPadOnly(t: 10),
                    CustomizedTextFieldGreyBg(
                      controller: logic.emailController,
                      hintText: 'Enter password',
                      focusNode: logic.emailFocusNode,
                      nextFocusNode: logic.passwordFocusNode,
                      validator: logic.validateEmail,
                    ).cPadOnly(t: 10),
                    const SizedBox(height: 40),
                    CommonButton(
                      text: 'Login',
                      bgColor: primaryColor,
                      txtColor: Colors.white,
                      onTap: (){
                        Get.toNamed(Routes.signUp);
                        // logic.postData(context);
                        // logic.update();
                      },
                    ).cPadOnly(t: 10),
                  ],
                ).cPadAll(20)
              ],
            ),
          );
        }
      )
    );
  }
}
