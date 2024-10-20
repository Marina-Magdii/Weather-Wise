import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_wise/Core/RoutesManager.dart';
import 'package:weather_wise/Core/StringsManager.dart';
import 'package:weather_wise/Features/Home/presentation/manager/weather_cubit.dart';
import '../../Core/ColorsManager.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            ColorsManager.primary,
            Colors.white,
          ])),
      child: SafeArea(
        child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: REdgeInsets.all(30.0),
                  child: TextField(
                    onSubmitted: (value)  {
                       WeatherCubit.get(context).getWeather(value);
                      Navigator.pushNamed(context, RoutesManager.homeName);
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            borderSide: BorderSide(
                                width: 2.w, color: Colors.transparent)),
                        filled: true,
                        fillColor: ColorsManager.secondary,
                        hintText: StringsManager.search,
                        hintStyle: Theme.of(context).textTheme.titleSmall,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            borderSide: BorderSide(
                                width: 2.w, color: Colors.transparent)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            borderSide: BorderSide(
                                width: 2.w, color: Colors.transparent))),
                  ),
                ),
                SizedBox(
                  height: 153.h,
                ),
                Center(child: Lottie.asset(StringsManager.windAnimi)),
              ],
            )),
      ),
    );
  }
}
