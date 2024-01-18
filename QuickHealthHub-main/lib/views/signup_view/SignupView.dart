import 'package:get/get.dart';
import 'package:qhhub/consts/consts.dart';
import 'package:qhhub/controllers/auth_controller.dart';
import 'package:qhhub/resources/components/customButton.dart';
import 'package:qhhub/resources/components/customTextField.dart';
import 'package:qhhub/views/home_view/Home.dart';
import 'package:qhhub/views/loginView/loginView.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

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
                  AppAssets.icTooth,
                  width: 200,
                ),
                10.heightBox,
                AppStrings.signUp.text.make(),
                AppStrings.signUpNow.text.make(),
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
                      CustomTextField(
                          hint: AppStrings.fullname,
                          textController: controller.fullnameController),
                      10.heightBox,
                      CustomTextField(
                          hint: AppStrings.email,
                          textController: controller.emailController),
                      10.heightBox,
                      CustomTextField(
                          hint: AppStrings.password,
                          textController: controller.passwordController),
                      20.heightBox,
                      Align(
                          alignment: Alignment.centerRight,
                          child: AppStyles.normal(
                              title: AppStrings.forgotPassword)),
                      20.heightBox,
                      CustomButton(
                        buttonText: AppStrings.signUp,
                        onTap: () async {
                          await controller.signupUser();
                          if (controller.userCredential != null) {
                            Get.offAll(() => const LoginView());
                          }
                        },
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppStyles.normal(
                              title: AppStrings.alreadyHaveAccount),
                          8.widthBox,
                          AppStyles.bold(title: AppStrings.login)
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
