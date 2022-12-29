import 'package:first_application/presentation/forgot_password/forgot_password_view.dart';
import 'package:first_application/presentation/login/view/login_view.dart';
import 'package:first_application/presentation/main/main_view.dart';
import 'package:first_application/presentation/onboarding/view/onboarding_view.dart';
import 'package:first_application/presentation/register/register_view.dart';
import 'package:first_application/presentation/resources/string_manager.dart';
import 'package:first_application/presentation/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

import '../../app/di.dart';
import '../splash/splash_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String onBoardingRoute = '/onBoarding';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
  static const String forgotPasswordRoute = '/forgotPassword';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) =>  const OnBoardingView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(
                    AppStrings.noRouteFound), //todo move to string manager
              ),
              body: const Center(
                child:
                    Text(AppStrings.noRouteFound), //todo move to string manager
              ),
            ));
  }
}
