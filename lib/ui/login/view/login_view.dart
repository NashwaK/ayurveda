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
      backgroundColor: Colors.white,
      body: GetBuilder<LoginController>(
        builder: (logic) {
          return Form(
            key: logic.loginKey,
            child: SingleChildScrollView(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FirstPart(),
                      SizedBox(height: 15,),
                      Text('Email'),
                      CustomizedTextFieldGreyBg(
                        controller: logic.emailController,
                        hintText: 'Enter your email',
                        focusNode: logic.emailFocusNode,
                        nextFocusNode: logic.passwordFocusNode,
                        // validator: logic.validateEmail,
                      ).cPadOnly(t: 5,b: 15),
                      Text('Password'),
                      CustomizedTextFieldGreyBg(
                        controller: logic.passwordController,
                        hintText: 'Enter password',
                        focusNode: logic.passwordFocusNode,
                        // nextFocusNode: logic.passwordFocusNode,
                        // validator: logic.validateEmail,
                      ).cPadOnly(t: 5,b: 15),
                      const SizedBox(height: 40),
                      CommonButton(
                        text: 'Login',
                        bgColor: primaryColor,
                        txtColor: Colors.white,
                        onTap: (){
                          logic.postData(context);
                          logic.update();
                        },
                      ).cPadOnly(t: 10),
                    ],
                  ).cPadAll(20)
                ],
              ),
            ),
          );
        }
      )
    );
  }
}
