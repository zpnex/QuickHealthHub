import 'package:flutter/material.dart';
import 'package:qhhub/consts/consts.dart';
import 'package:qhhub/consts/images.dart';
import 'package:qhhub/consts/strings.dart';
import 'package:qhhub/resources/components/customButton.dart';
import 'package:qhhub/resources/components/customTextField.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.loginDoctor, width: 200,),
                  10.heightBox,
                  AppStrings.welcome.text.make(),
                ],
              ),
            ),
            Expanded(
              //flex: 2,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(hint: AppStrings.email),
                    10.heightBox,
                    CustomTextField(hint: AppStrings.password),
                    20.heightBox,
                    Align(
                      alignment: Alignment.centerRight,
                      child: AppStrings.forgotPassword.text.make(),
                    ),
                    20.heightBox,
                    CustomButton(
                      buttonText: AppStrings.login,
                      onTap: () {},
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppStrings.dontHaveAccount.text.make(),
                        8.widthBox,
                        AppStrings.signUp.text.make(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
