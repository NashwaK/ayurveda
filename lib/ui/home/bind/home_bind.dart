import 'package:ayurveda/model/patientlist_model.dart';
import 'package:ayurveda/utilities/api_provider.dart';
import 'package:ayurveda/utilities/com_binding.dart';
import 'package:ayurveda/utilities/session_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeBind implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  PatientListModelClass?patientListModelClass;

  final searchController = TextEditingController();
  var searchFocusNode = FocusNode();

  var searchQuery = "".obs;
  var sortBy = "Date".obs;

  @override
  void onInit() {
    getPatientList();
    var a = patientListModelClass?.patient?.cFirst?.name ?? '';
    print('var a===$a');
    super.onInit();
  }

  Future<void> getPatientList() async {
    try {
      if (AppSession.to.session.read(SessionKeys.TOKEN) == null) {
        return;
      }

      EasyLoading.show();

      patientListModelClass = await Api.to.getPatientList();
      update();

      print('Response message: ${patientListModelClass?.message ?? ''}');
      print('Patient list: ${patientListModelClass?.patient ?? 'No Data'}');

      update();
    } catch (ex) {
      debugPrint('Error in getGiftList: $ex');
    } finally {
      EasyLoading.dismiss();
    }
  }
}