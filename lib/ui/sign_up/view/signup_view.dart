import 'package:ayurveda/res/colors.dart';
import 'package:ayurveda/ui/sign_up/bind/signup_bind.dart';
import 'package:ayurveda/ui/sign_up/view/more.dart';
import 'package:ayurveda/utilities/app_route.dart';
import 'package:ayurveda/utilities/common_textfield.dart';
import 'package:ayurveda/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar('', Colors.white),
      body: GetBuilder<SignUpController>(
        builder: (logic) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Register',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),).cPadOnly(l: 20),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name',style: TextStyle(color: textColor),),
                    CustomizedTextFieldGreyBg(
                      controller: logic.nameController,
                      hintText: 'Enter your full name',
                      focusNode: logic.nameFocusNode,
                      nextFocusNode: logic.whatsappFocusNode,
                    ).cPadOnly(t: 5,b: 15),
                    Text('Whatsapp Number',style: TextStyle(color: textColor),),
                    CustomizedTextFieldGreyBg(
                      controller: logic.whatsappController,
                      hintText: 'Enter your whatsapp number',
                      focusNode: logic.whatsappFocusNode,
                      nextFocusNode: logic.addressFocusNode,
                    ).cPadOnly(t: 5,b: 15),
                    Text('address',style: TextStyle(color: textColor),),
                    CustomizedTextFieldGreyBg(
                      controller: logic.addressController,
                      hintText: 'Enter your full address',
                      focusNode: logic.addressFocusNode,
                      // nextFocusNode: logic.passwordFocusNode,
                    ).cPadOnly(t: 5,b: 15),
                    Text('Location',style: TextStyle(color: textColor),),
                    LocationDropdown().cPadOnly(t: 5,b: 15),
                    Text('Branch',style: TextStyle(color: textColor),),
                    BranchDropdown().cPadOnly(t: 5,b: 15),
                    Text('Branch',style: TextStyle(color: textColor),),
                    TreatmentSelection().cPadOnly(t: 5,b: 15),
                    CommonButton(
                      text: 'Add Treatments',
                      bgColor: Color.fromRGBO(56, 154, 72, 0.4),
                      txtColor: Colors.black,
                      icon: Icons.add,
                      onTap: (){
                        // Get.toNamed(Routes.login);
                        // logic.postData(context);
                        // logic.update();
                      },
                    ).cPadOnly(b: 15),
                    Text('Total Amount',style: TextStyle(color: textColor),),
                    CustomizedTextFieldGreyBg(
                      controller: logic.totalAmountController,
                      hintText: '',
                      focusNode: logic.totalAmountFocusNode,
                      // nextFocusNode: logic.addressFocusNode,
                    ).cPadOnly(t: 5,b: 15),
                    Text('Payment Option',style: TextStyle(color: textColor),),
                    PaymentOption().cPadOnly(b: 15),
                    Text('Advance Amount',style: TextStyle(color: textColor),),
                    CustomizedTextFieldGreyBg(
                      controller: logic.advanceAmountController,
                      hintText: '',
                      focusNode: logic.advanceAmountFocusNode,
                      nextFocusNode: logic.balanceAmountFocusNode,
                    ).cPadOnly(t: 5,b: 15),
                    Text('Balance Amount',style: TextStyle(color: textColor),),
                    CustomizedTextFieldGreyBg(
                      controller: logic.balanceAmountController,
                      hintText: '',
                      focusNode: logic.balanceAmountFocusNode,
                      // nextFocusNode: logic.addressFocusNode,
                    ).cPadOnly(t: 5,b: 15),
                    DateFilterPart().cPadOnly(b: 15),

                    // Treatment Time
                    Text('Treatment Time',style: TextStyle(color: textColor),),
                    TreatmentTimePart().cPadOnly(t: 5,b: 50),

                    CommonButton(
                      text: 'Save',
                      bgColor: primaryColor,
                      txtColor: Colors.white,
                      onTap: (){
                        Get.toNamed(Routes.home);
                        // logic.postData(context);
                        // logic.update();
                      },
                    ).cPadOnly(b: 15),
                  ],
                ).cPadAll(20)
              ],
            ),
          );
        }
      ),
    );
  }
}
