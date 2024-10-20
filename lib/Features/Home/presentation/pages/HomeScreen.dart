import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_wise/Core/ColorsManager.dart';
import 'package:weather_wise/Core/StringsManager.dart';
import 'package:weather_wise/Features/Home/domain/entities/ResponseEntity.dart';
import 'package:weather_wise/Features/Home/presentation/manager/weather_cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, this.entity});
  ResponseEntity? entity;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<WeatherCubit, WeatherState>(
  builder: (context, state) {
    if(state is ErrorWeather){
      return Center(child: Text("Error: ${state.error}"));
    }
    if (state is LoadingWeather){
      return Container(
          decoration: const BoxDecoration(
              gradient:
              LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,
                  colors: [ColorsManager.primary, Colors.white])),
          child: Scaffold(body: Center(child:Lottie.asset(StringsManager.windAnimi))));
    }
    var entity = WeatherCubit.get(context).entity;
    return Container(
      decoration: const BoxDecoration(
          gradient:
          LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,
              colors: [ColorsManager.primary, Colors.white])),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 30.h,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(
              color: Colors.white
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: REdgeInsets.all(20.0),
                child: SizedBox(
                    height: 100.h,
                    child: Lottie.asset(StringsManager.splashAnimi)),
              ),
              Padding(
                padding: REdgeInsets.all(15.0),
                child: Text(
                  "${entity?.location?.name}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Text(
                "Day: ${toStringDate(entity?.current!.lastUpdated ?? "").day}-${toStringDate(entity?.current!.lastUpdated ?? "").month}-${toStringDate(entity?.current!.lastUpdated ?? "").year}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "Updated at: ${toStringDate(entity?.current!.lastUpdated ?? "").hour}:${toStringDate(entity?.current!.lastUpdated ?? "").minute}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: REdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network("https:${entity?.current?.condition?.icon}"),
                    Text(
                      "${entity?.current?.tempC?.round()}ْ°C",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "${entity?.current?.condition?.text}",
                      style: TextStyle(
                          color: ColorsManager.yellow,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Almarai"),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                    padding: REdgeInsets.all(25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 5.0,
                          ),
                        ],
                        color: ColorsManager.primary,
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      ),
                      child: Padding(
                        padding: REdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Temperature: ${entity?.current?.tempF?.round()}ْ°F",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              "Cloud: ${entity?.current?.cloud??""}ْ°C",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              "Humidity: ${entity?.current?.humidity}ْ%",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              "Wind Speed: ${entity?.current?.windKph??""}ْ km/h",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              "Wind Direction: ${entity?.current?.windDir}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  },
);
  }

  DateTime toStringDate(String time) {
    return DateTime.parse(time);
  }
}
