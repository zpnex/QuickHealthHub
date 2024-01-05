import 'package:flutter/material.dart';
import 'package:qhhub/consts/colors.dart';
import 'package:qhhub/consts/consts.dart';
import 'package:qhhub/consts/fonts.dart';
import 'package:qhhub/consts/strings.dart';
import 'package:qhhub/resources/components/customButton.dart';

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
        child: SingleChildScrollView(
            child: Column(
           
            children: [
            Container(
              padding: const EdgeInsets.all(12),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.whiteColor,
              ),
              child: Row(
                
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Image.asset(AppAssets.loginDoctor),
                  ),
                  10.widthBox,
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppStyles.bold(
                          title: "Doctor name",
                          color: AppColors.textColor,
                          size: AppSizes.size14,
                        ),
                        AppStyles.bold(
                          title: "Category",
                          color: AppColors.textColor.withOpacity(0.5),
                          size: AppSizes.size14,
                        
                        ),
                        const Spacer(),
                        VxRating(
                          selectionColor: AppColors.yellowColor,
                          onRatingUpdate: (value){},
                          maxRating: 5,
                          count: 5,
                          value: 4,
                          stepInt: true,)
                    
                    
                    
                      ],
                    ),
                  ),
                  AppStyles.bold(
                        title: "see all reviews",
                        color: AppColors.blueColor,
                        size: AppSizes.size12,)
          
          
          
                ],
              ),
            ),
            10.heightBox,
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.whiteColor,
              ),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                  title:AppStyles.bold(title: "Phone Number")
                  ,subtitle: AppStyles.normal(title: "+94 77840920",color: AppColors.textColor.withOpacity(0.5),size: AppSizes.size12),
                  trailing: Container(
          
                    width: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                      color: AppColors.yellowColor,
                    ),
                    child: Icon(Icons.phone,color: AppColors.whiteColor,)),
                ),
                10.heightBox,
                AppStyles.bold(title: "About",color: AppColors.textColor,size: AppSizes.size16),
                5.heightBox,
                 AppStyles.normal(title: "This is about section about doctor",color: AppColors.textColor.withOpacity(0.5),size: AppSizes.size12),
                
                10.heightBox,
                AppStyles.bold(title: "Address",color: AppColors.textColor,size: AppSizes.size16),
                5.heightBox,
                 AppStyles.normal(title: "Address of the doctor",color: AppColors.textColor.withOpacity(0.5),size: AppSizes.size12),
                10.heightBox,
                AppStyles.bold(
                  title: "Working Time",
                  color: AppColors.textColor,
                  size: AppSizes.size14
                ),
                5.heightBox,
                 AppStyles.normal(title: "9:00 AM to 12:PM",color: AppColors.textColor.withOpacity(0.5),size: AppSizes.size12),
          
                10.heightBox,
                AppStyles.bold(
                  title: "Services",
                  color: AppColors.textColor,
                  size: AppSizes.size14
                ),
                5.heightBox,
                 AppStyles.normal(title: "This is a service section of a doctor",color: AppColors.textColor.withOpacity(0.5),size: AppSizes.size12),
          
          
          
          
               ], 
              ),
          
          
          
            )
          ]),
        ),
      ),
  bottomNavigationBar: Padding(
    padding: const EdgeInsets.all(10.0),
    child: CustomButton(buttonText: "Book an appoinment",onTap: (){},),
  ),


    );
  }
}
