import 'package:get/get.dart';
import 'package:redditum_flapp/app/routes/app_routes.dart';
import 'package:redditum_flapp/app/ui/views/forgot_password/forgot_password_binding.dart';
import 'package:redditum_flapp/app/ui/views/forgot_password/forgot_password_view.dart';
import 'package:redditum_flapp/app/ui/views/home/home_binding.dart';
import 'package:redditum_flapp/app/ui/views/home/home_view.dart';
import 'package:redditum_flapp/app/ui/views/login/login_binding.dart';
import 'package:redditum_flapp/app/ui/views/login/login_view.dart';
import 'package:redditum_flapp/app/ui/views/profile/profile_binding.dart';
import 'package:redditum_flapp/app/ui/views/profile/profile_view.dart';
import 'package:redditum_flapp/app/ui/views/splash/splash_binding.dart';
import 'package:redditum_flapp/app/ui/views/splash/splash_view.dart';

abstract class AppViews {
  static final views = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
