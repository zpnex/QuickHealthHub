
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:qhhub/consts/consts.dart';
import 'package:qhhub/controllers/appoinment_controller.dart';
import 'package:qhhub/controllers/auth_controller.dart';

import '../appointment_details_view/AppointmentDetailsView.dart';

class AppointmentView extends StatelessWidget {
  final bool isDoctor;
  const AppointmentView({super.key, this.isDoctor = false});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppoinmentController());

    return Scaffold(
      appBar: AppBar(
        title: AppStyles.bold(
          title: "Appointments",
          color: AppColors.blueColor,
          size: AppSizes.size18,
        ),
        actions: [
          IconButton(
              onPressed: () {
                AuthController().signout();
              },
              icon: Icon(Icons.power_settings_new_rounded))
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: controller.getAppoinments(isDoctor),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = snapshot.data?.docs;

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Get.to(() => AppointmentDetailsView(
                            doc: data[index],
                          ));
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image.asset(AppAssets.loginDoctor),
                    ),
                    title: AppStyles.bold(
                      title: data![index][!isDoctor ? 'appWithName' : 'appName'],
                    ),
                    subtitle: AppStyles.normal(
                      title:
                          "${data[index]['appDay']} - ${data[index]['appTime']} ",
                      color: AppColors.textColor.withOpacity(0.5),
                      size: AppSizes.size14,
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
