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
        title: AppStyles.bold(
            title: "${AppStrings.welcome} User",
            color: AppColors.whiteColor,
            size: AppSizes.size20),
        backgroundColor: AppColors.blueColor,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            height: 100,
            color: AppColors.blueColor,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hint: AppStrings.search,
                    boaderColor: AppColors.whiteColor,
                    textColor: AppColors.whiteColor,
                  ),
                ),
                10.widthBox,
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    color: AppColors.whiteColor)
              ],
            ),
          ),
          20.heightBox,
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext contex, int index) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(right: 8),
                    color: Colors.red,
                    height: 44,
                    width: 44,
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.icBrain,
                          width: 28,
                          color: AppColors.whiteColor,
                        ),
                        5.heightBox,
                        AppStyles.normal(
                            title: "Body",
                            color: AppColors.whiteColor,
                            size: AppSizes.size14)
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
