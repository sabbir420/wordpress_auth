import 'package:get/get.dart';

import 'package:wordpress_auth/app/modules/home/bindings/home_binding.dart';
import 'package:wordpress_auth/app/modules/home/views/home_view.dart';
import 'package:wordpress_auth/app/modules/signin/bindings/signin_binding.dart';
import 'package:wordpress_auth/app/modules/signin/views/signin_view.dart';
import 'package:wordpress_auth/app/modules/signup/bindings/signup_binding.dart';
import 'package:wordpress_auth/app/modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
  ];
}
