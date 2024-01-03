import 'package:qhhub/consts/consts.dart';
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
                  Image.asset(
                    AppAssets.loginDoctor,
                    width: 200,
                  ),
                  10.heightBox,
                  AppStrings.welcome.text.make(),
                  AppStrings.welcomePara.text.make(),
                  AppStyles.bold(
                      title: AppStrings.appName,
                      size: AppSizes.size34,
                      color: AppColors.primaryColor),
                ],
              ),
            ),
            Expanded(
              //flex: 2,
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
