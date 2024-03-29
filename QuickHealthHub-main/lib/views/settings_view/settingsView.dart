import 'package:get/get.dart';
import 'package:sampleapp/consts/consts.dart';
import 'package:sampleapp/consts/lists.dart';
import 'package:sampleapp/controllers/auth_controller.dart';
import 'package:sampleapp/controllers/settings_controller.dart';
import 'package:sampleapp/views/login_view/loginView.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(
          title: AppStrings.setings,
          color: AppColors.whiteColor,
          size: AppSizes.size18,
        ),
      ),
      body: Obx(()=>
      controller.isLoading.value ? const Center(child: CircularProgressIndicator(),):
         Column(
          children: [
            ListTile(
              leading: CircleAvatar(child: Image.asset(AppAssets.loginDoctor)),
              title: AppStyles.bold(title: controller.username.value),
              subtitle: AppStyles.normal(title: controller.email.value),
            ),
            const Divider(),
            10.heightBox,
            ListView(
              shrinkWrap: true,
              children: List.generate(
                settingsList.length,
                (index) => ListTile(
                  onTap: () {
                    if (index == 2) {
                      AuthController().signout();
                      Get.offAll(() => const LoginView());
                    }
                  },
                  leading: Icon(
                    settingsListIcons[index],
                    color: AppColors.blueColor,
                  ),
                  title: AppStyles.bold(title: settingsList[index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
