import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_wise/Core/AppStyle.dart';
import 'package:weather_wise/Core/RoutesManager.dart';
import 'package:weather_wise/Features/GetStarted/GetStarted.dart';
import 'package:weather_wise/Features/Home/presentation/manager/weather_cubit.dart';
import 'package:weather_wise/Features/Home/presentation/pages/HomeScreen.dart';
import 'package:weather_wise/Features/Search/SearchScreen.dart';
import 'package:weather_wise/Features/Splash/SplashScreen.dart';
import 'Core/ApiManager.dart';
import 'Core/DI/Di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  ApiManager.init();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WeatherCubit>(),
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        builder: (context, child) {
          return MaterialApp(
            theme: AppStyle.lightTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesManager.splashName,
            routes: {
              RoutesManager.searchName: (_) => SearchScreen(),
              RoutesManager.homeName: (_) => HomeScreen(),
              RoutesManager.splashName: (_) => SplashScreen(),
              RoutesManager.getStartedName: (_) => GetStarted()
            },
            title: 'WeatherWise',
          );
        },
      ),
    );
  }
}
