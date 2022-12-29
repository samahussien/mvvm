import 'dart:async';

import 'package:first_application/presentation/resources/assets_manager.dart';
import 'package:first_application/presentation/resources/color_manager.dart';
import 'package:first_application/presentation/resources/constants_manager.dart';
import 'package:first_application/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(
        const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: Image.asset(ImageAssets.splashLogo)),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();

    // TODO: implement dispose
    super.dispose();
  }
}
