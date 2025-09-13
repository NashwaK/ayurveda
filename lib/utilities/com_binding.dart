import 'package:ayurveda/utilities/api_provider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get_storage/get_storage.dart';

class ComBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Api(), fenix: true);
    Get.put(AppSession());
    // Get.put(AppController());
  }
}

class AppSession extends GetxController {
  static AppSession get to => Get.find();
  var session = GetStorage('order_own');

}