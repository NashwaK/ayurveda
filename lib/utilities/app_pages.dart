import 'package:ayurveda/ui/home/bind/home_bind.dart';
import 'package:ayurveda/ui/home/view/home_view.dart';
import 'package:ayurveda/ui/login/bind/login_bind.dart';
import 'package:ayurveda/ui/login/view/login_view.dart';
import 'package:ayurveda/ui/sign_up/bind/signup_bind.dart';
import 'package:ayurveda/ui/sign_up/view/signup_view.dart';
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
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBind(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBind(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => const SignUpView(),
      binding: SignUpBind(),
    ),
  ];
}