import 'package:get/get.dart';
import 'package:qhhub/consts/consts.dart';
import 'package:qhhub/controllers/auth_controller.dart';
import 'package:qhhub/resources/components/customButton.dart';
import 'package:qhhub/resources/components/customTextField.dart';
import 'package:qhhub/views/loginView/loginView.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  var isDoctor = false;

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
                      10.heightBox,
                      SwitchListTile(
                        title: "Sign up as a doctor".text.make(),
                          value: isDoctor,
                          onChanged: (newValue) {
                            setState(() {
                              isDoctor = newValue;
                            });
                          }),
                      Visibility(
                        visible: isDoctor,
                        child: Column(
                          children: [
                            CustomTextField(
                                hint: "About",
                                textController: controller.aboutController),
                            10.heightBox,
                            CustomTextField(
                                hint: "Category",
                                textController: controller.categoryController),
                            10.heightBox,
                            CustomTextField(
                                hint: "Services",
                                textController: controller.seviceController),
                            10.heightBox,
                            CustomTextField(
                                hint: "Address",
                                textController: controller.addressController),
                            10.heightBox,
                            CustomTextField(
                                hint: "Phone Number",
                                textController: controller.phoneController),
                            10.heightBox,
                            CustomTextField(
                                hint: "Timing",
                                textController: controller.timingController),
                            10.heightBox,
                          ],
                        ),
                      ),
                      20.heightBox,
                      Align(
                          alignment: Alignment.centerRight,
                          child: AppStyles.normal(
                              title: AppStrings.forgotPassword)),
                      20.heightBox,
                      CustomButton(
                        buttonText: AppStrings.signUp,
                        onTap: () async {
                          await controller.signupUser(isDoctor);
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
