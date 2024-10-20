import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_wise/Core/ApiManager.dart';
import 'package:weather_wise/Core/ColorsManager.dart';

class CustomContainer extends StatelessWidget {
   CustomContainer({super.key,required this.title,required this.lan,required this.temp});
  final ApiManager apiManager=ApiManager();
  String title;
  String temp;
  String lan;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){},
      child: Padding(
        padding: REdgeInsets.only(
          left: 35,
          right: 35,
          bottom: 10,
          top: 10
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            gradient: const LinearGradient(
              colors: [
                ColorsManager.primary,
                ColorsManager.secondary,
              ]
            ),
            boxShadow:  [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 2.r,
                blurRadius: 10.r,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:REdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                    style: TextStyle(
                      fontSize:  35.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                    SizedBox(height: 10.h),
                    Text(lan,
                    style: TextStyle(
                      fontSize:  25.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                  ],
                ),
              ),
              Padding(
                padding: REdgeInsets.all(20.0),
                child: Text(temp,
                style: TextStyle(
                  fontSize:  45.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
