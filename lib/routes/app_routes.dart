import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo_list/routes/routes_name.dart';
import 'package:todo_list/user/addto_list.dart';
import 'package:todo_list/user/home_screen.dart';
import 'package:todo_list/user/profile_screen.dart';
import 'package:todo_list/view/auth/forgot_password.dart';
import 'package:todo_list/view/auth/onboarding.dart';
import 'package:todo_list/view/auth/signin_screen.dart';
import 'package:todo_list/view/auth/signup_screen.dart';
import 'package:todo_list/view/auth/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(name: RouteNames.splashScreen, page: () => SplashScreen()),
        GetPage(name: RouteNames.onbording, page: () => Onboarding()),
        GetPage(name: RouteNames.signin, page: () => SignInScreen()),
        GetPage(name: RouteNames.signup, page: () => SignupScreen()),
        GetPage(name: RouteNames.forgotPassword, page: () => Forgotpassword()),
        GetPage(name: RouteNames.home, page: () => HomeScreen()),
        GetPage(name: RouteNames.addlist, page: () => AddtoList()),
        GetPage(name: RouteNames.profile, page: () => ProfileScreen()),
      ];
}
