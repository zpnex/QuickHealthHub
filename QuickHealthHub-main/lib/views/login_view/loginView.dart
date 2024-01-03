import 'package:get/route_manager.dart';
import 'package:qhhub/consts/consts.dart';
import 'package:qhhub/resources/components/customButton.dart';
import 'package:qhhub/resources/components/customTextField.dart';
import 'package:qhhub/views/home_view/HomeView.dart';
import 'package:qhhub/views/signup_view/SignupView.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Column(
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
            30.heightBox,
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
                          child: AppStyles.normal(
                              title: AppStrings.forgotPassword)),
                      20.heightBox,
                      CustomButton(
                        buttonText: AppStrings.login,
                        onTap: () {
                          Get.to(() => const HomeView());
                        },
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppStyles.normal(title: AppStrings.dontHaveAccount),
                          8.widthBox,
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SignupView());
                            },
                            child: AppStyles.bold(title: AppStrings.signUp),
                          )
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
