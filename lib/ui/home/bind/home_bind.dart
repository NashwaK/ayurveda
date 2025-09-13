import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBind implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final searchController = TextEditingController();
  var searchFocusNode = FocusNode();

  var searchQuery = "".obs;
  var sortBy = "Date".obs;

  var bookings = [
    {
      "id": 1,
      "name": "Vikram Singh",
      "package": "Couple Combo Package (Rejuvenation)",
      "date": "31/01/2024",
      "doctor": "Jithesh",
      "isRegistered": true,
    },
    {
      "id": 2,
      "name": "Vikram Singh",
      "package": "Couple Combo Package (Rejuvenation)",
      "date": "31/01/2024",
      "doctor": "Jithesh",
      "isRegistered": true,
    },
    {
      "id": 3,
      "name": "Vikram Singh",
      "package": "Couple Combo Package (Rejuvenation)",
      "date": "31/01/2024",
      "doctor": "Jithesh",
      "isRegistered": false,
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }
}