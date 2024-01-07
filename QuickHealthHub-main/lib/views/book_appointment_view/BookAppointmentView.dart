import 'package:qhhub/resources/components/customButton.dart';
import 'package:qhhub/resources/components/customTextField.dart';

import '../../consts/consts.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyles.bold(title: "Select Appointment Day"),
              const CustomTextField(hint: "Select Day"),
              10.heightBox,
              AppStyles.bold(title: "Select Appointment Time"),
              const CustomTextField(hint: "Select Time"),
              10.heightBox,
              AppStyles.bold(title: "Mobile Number"),
              const CustomTextField(hint: "Enter Mobile Number"),
              10.heightBox,
              AppStyles.bold(title: "Full Name"),
              const CustomTextField(hint: "Enter Full Name"),
              10.heightBox,
              AppStyles.bold(title: "Message"),
              const CustomTextField(hint: "Enter Your Message"),
              10.heightBox,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(
          buttonText: "Book an appoinment",
          onTap: () {},
        ),
      ),
    );
  }
}
