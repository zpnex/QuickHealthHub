import 'package:flutter/material.dart';
import 'package:qhhub/consts/consts.dart';
import 'package:qhhub/resources/components/customTextField.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  elevation: 0.0,
  title: AppStyles.bold(title: "${AppStrings.welcome} User", color:AppColors.whiteColor, size: AppSizes.size20),
  backgroundColor: AppColors.blueColor,
),

      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height:100,
            color: AppColors.blueColor,
            child: CustomTextField(hint: AppStrings.search),


          ),
        ],
      ),
    );
  }
}