import 'package:qhhub/consts/consts.dart';
import 'package:qhhub/consts/lists.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(
          title: AppStrings.setings,
          color: AppColors.whiteColor,
          size: AppSizes.size18,
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Image.asset(AppAssets.loginDoctor),
            ),
            title: AppStyles.bold(title: "UserName"),
            subtitle: AppStyles.normal(title: "userName@gmail.com"),
          ),
          const Divider(),
          10.heightBox,
          ListView(
            shrinkWrap: true,
            children: List.generate(
              settingsList.length,
              (index) => ListTile(
                onTap: () {},
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
    );
  }
}
