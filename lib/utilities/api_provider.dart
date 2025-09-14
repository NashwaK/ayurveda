import 'package:ayurveda/model/login_model.dart';
import 'package:ayurveda/model/patientlist_model.dart';
import 'package:ayurveda/utilities/com_binding.dart';
import 'package:ayurveda/utilities/session_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_custom_utils/util/string_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_core/src/get_main.dart';

class Api extends GetConnect {
//------------------------------- oms -------------------------------
  static Api get to => Get.find();
  final error = false;
  final message = 'some error';
  var err = {'error': false, 'message': 'Network Or Other related issue'};

//------------------------------- oms -------------------------------
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = baseUrlCommon;
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Authorization'] =
      'Bearer ${AppSession.to.session.read(SessionKeys.TOKEN) ?? ' '}';
      return request;
    });
  }

  Future<LoginModelClass> userLogin({
    required String userName,
    required String password,
  }) {
    print('This is started---<>');
    return post(
      'Login',
      cFormUrlEncode(
        {
          'username': userName,
          'password': password,
        },
      ),
      contentType: 'application/x-www-form-urlencoded',
    ).then((value) {
      if (kDebugMode) {
        print('data ---------yg>${value.body}');
        print('emailOrMobile --------->${userName}');
        print('password --------->${password}');
      }
      return LoginModelClass.fromJson(value.body ?? err);
    });
  }

  Future<PatientListModelClass> getPatientList() {
    return get(
      'PatientList',
    ).then((value) {
      if (kDebugMode) {
        print('patient  List = ${value.body}');
        print('patient  List = ${value.statusCode}');
      }
      return PatientListModelClass.fromJson(value.body ?? err);
    });
  }
}