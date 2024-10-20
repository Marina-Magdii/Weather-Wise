import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_wise/Core/StringsManager.dart';
import '../../Core/ColorsManager.dart';
import '../../Core/RoutesManager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4),(){
      Navigator.pushReplacementNamed(context,RoutesManager.getStartedName );
    });
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient:  LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                ColorsManager.primary,
                Colors.white,
              ]
          ),),
      child: Scaffold(
        body: Center(
          child: SvgPicture.asset(StringsManager.logo)
          .animate().fade(end: 1,begin: 0,
              duration: const Duration(seconds: 3)),
        ),
      ),
    );
  }
}
