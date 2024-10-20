import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_wise/Core/ColorsManager.dart';
import 'package:weather_wise/Core/RoutesManager.dart';
import 'package:weather_wise/Core/StringsManager.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
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
        )
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
           SizedBox(
               child: Lottie.asset(StringsManager.splashAnimi)),
                   SizedBox(
              height: 20.h,
            ),
            Center(child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  StringsManager.welcome,
                style: Theme.of(context).textTheme.titleLarge).animate().fade(duration: const Duration(seconds: 3)),
                Text(
                  textAlign: TextAlign.center,
                  StringsManager.weatherWise,
                style: Theme.of(context).textTheme.titleLarge).animate().fade(duration: const Duration(seconds: 3)),
              ],
            )),
            const Spacer(),
            InkWell(
              onTap: (){
                Navigator.pushNamedAndRemoveUntil(context, RoutesManager.searchName, (route) => false);
              },
              child: Padding(
                padding: REdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: ColorsManager.yellow,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0.0, 2.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child:Padding(
                    padding:REdgeInsets.all(10.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      StringsManager.getStarted,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp
                    ),),
                  ),)
                ),
            ),
          ],
        ),
      ),
    );
  }
}
