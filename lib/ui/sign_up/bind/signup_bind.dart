import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpBind implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}

class SignUpController extends GetxController {
  static SignUpController get to => Get.find();

  final nameController = TextEditingController();
  final whatsappController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final totalAmountController = TextEditingController();
  final advanceAmountController = TextEditingController();
  final balanceAmountController = TextEditingController();

  var nameFocusNode = FocusNode();
  var whatsappFocusNode = FocusNode();
  var addressFocusNode = FocusNode();
  var passwordFocusNode = FocusNode();
  var totalAmountFocusNode = FocusNode();
  var advanceAmountFocusNode = FocusNode();
  var balanceAmountFocusNode = FocusNode();

  var selectedLocation = RxnString();
  var selectedBranch = RxnString();

  final locations = ["New York", "London", "Paris", "Tokyo", "Delhi"];
  final branches = ["branches1", "branches2", "branches3", "branches4", "branches5"];

  var selectedPaymentOption = "".obs;

  final paymentOptions = ["Cash", "Card", "UPI"];

  var selectedDate = "".obs;
  var selectedHour = "".obs;
  var selectedMinute = "".obs;

  final hours = List.generate(24, (index) => index.toString().padLeft(2, '0'));
  final minutes = List.generate(60, (index) => index.toString().padLeft(2, '0'));

  @override
  void onInit() {
    super.onInit();
  }
}