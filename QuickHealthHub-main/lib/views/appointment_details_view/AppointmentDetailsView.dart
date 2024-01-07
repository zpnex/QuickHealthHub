
import '../../consts/consts.dart';

class AppointmentDetailsView extends StatelessWidget {
  const AppointmentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(
          title: "Doctor Name",
          size: AppSizes.size18,
          color: AppColors.whiteColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppStyles.bold(title: "Select Appointment Day"),
            AppStyles.normal(title: "Selected Day"),
            10.heightBox,
            AppStyles.bold(title: "Select Appointment Time"),
            AppStyles.normal(title: "Selected Time"),
            10.heightBox,
            AppStyles.bold(title: "Mobile Number"),
            AppStyles.normal(title: "Mobile Number"),
            10.heightBox,
            AppStyles.bold(title: "Full Name"),
            AppStyles.normal(title: "Full Name"),
            10.heightBox,
            AppStyles.bold(title: "Message"),
            AppStyles.normal(title: "Message"),
            10.heightBox,
            
          ],
        ),
      ),
    );
  }
}
