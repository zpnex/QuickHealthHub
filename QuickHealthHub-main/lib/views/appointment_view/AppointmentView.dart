import 'package:get/route_manager.dart';
import 'package:qhhub/consts/consts.dart';

import '../appointment_details_view/AppointmentDetailsView.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: AppStyles.bold(
            title: "Category name",
            color: AppColors.blueColor,
            size: AppSizes.size18,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(itemCount: 4, itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Get.to(()=> const AppointmentDetailsView());
              
              },
              leading: CircleAvatar(
                radius: 30,
                child: Image.asset(AppAssets.loginDoctor),
              ),
              title: AppStyles.bold(
                title: "Doctor name",
              ),
              subtitle: AppStyles.normal(
                title: "Appointment time", color: AppColors.textColor.withOpacity(0.5), size: AppSizes.size14,
              ),
          
            );
          },
          ),
        ),
        
    );
  }
}