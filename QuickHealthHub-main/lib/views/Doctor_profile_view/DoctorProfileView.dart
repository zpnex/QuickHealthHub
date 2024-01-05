import 'package:flutter/material.dart';
import 'package:qhhub/consts/colors.dart';
import 'package:qhhub/consts/consts.dart';
import 'package:qhhub/consts/fonts.dart';
import 'package:qhhub/consts/strings.dart';

class DoctorProfileView extends StatelessWidget {
  const DoctorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDarkColor,
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(
          title: "Doctor name",
          color: AppColors.whiteColor,
          size: AppSizes.size18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColors.whiteColor,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  child: Image.asset(AppAssets.loginDoctor),
                ),
                Column(
                  children: [
                    AppStyles.bold(
                      title: "Doctor name",
                      color: AppColors.whiteColor,
                      size: AppSizes.size14,
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
