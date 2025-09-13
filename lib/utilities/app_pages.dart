import 'package:ayurveda/ui/splash/bind/splash_bind.dart';
import 'package:ayurveda/ui/splash/view/splash_view.dart';
import 'package:ayurveda/utilities/app_route.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBind(),
    ),
  ];
}