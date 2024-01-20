import 'package:get/get.dart';
import 'package:sampleapp/consts/consts.dart';
import 'package:sampleapp/controllers/auth_controller.dart';
import 'package:sampleapp/resources/components/customButton.dart';
import 'package:sampleapp/resources/components/customTextField.dart';
import 'package:sampleapp/views/appointment_view/AppointmentView.dart';
import 'package:sampleapp/views/home_view/Home.dart';
import 'package:sampleapp/views/signup_view/SignupView.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var isDoctor = false;

  // var isLoading = true;
  // @override
  // void initState() {
  //   AuthController().isUserAlreadyLoggedIn();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/ffeac2.png', 
              fit: BoxFit.cover,
            ),
          ),
          Container(
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
                        color: Color(0xffffa600)),
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
                            hint: AppStrings.email,
                            textController: controller.emailController,
                          ),
                          10.heightBox,
                          CustomTextField(
                            hint: AppStrings.password,
                            textController: controller.passwordController,
                            isPassword: true,
                          ),
                          10.heightBox,
                          SwitchListTile(
                            value: isDoctor,
                            onChanged: (newValue) {
                              setState(() {
                                isDoctor = newValue;
                              });
                            },
                            title: "Sign in as a doctor".text.make(),
                          ),
                          20.heightBox,
                          Align(
                              alignment: Alignment.centerRight,
                              child: AppStyles.normal(
                                  title: AppStrings.forgotPassword)),
                          20.heightBox,
                          CustomButton(
                            buttonText: AppStrings.login,
                            onTap: () async {
                              await controller.loginUser();
                              if (controller.userCredential != null) {
                                if (isDoctor) {
                                  Get.to(() =>
                                      const AppointmentView()); 
                                } else {
                                  Get.to(
                                      () => const Home()); 
                                }
                              }
                            },
                          ),
                          20.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppStyles.normal(
                                  title: AppStrings.dontHaveAccount),
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
        ],
      ),
    );
  }
}
