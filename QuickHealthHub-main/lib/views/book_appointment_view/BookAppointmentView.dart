import 'package:get/get.dart';
import 'package:qhhub/controllers/appoinment_controller.dart';
import 'package:qhhub/resources/components/customButton.dart';
import 'package:qhhub/resources/components/customTextField.dart';

import '../../consts/consts.dart';

class BookAppointmentView extends StatelessWidget {
  final String docId;
  final String docName;

  const BookAppointmentView(
      {super.key, required this.docId, required this.docName});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppoinmentController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(
          title: docName,
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
              CustomTextField(hint: "Select Day",textController: controller.appDayController,),
              10.heightBox,
              AppStyles.bold(title: "Select Appointment Time"),
              CustomTextField(hint: "Select Time",textController: controller.appTimeController,),
              10.heightBox,
              AppStyles.bold(title: "Mobile Number"),
              CustomTextField(hint: "Enter Mobile Number",textController: controller.appMobileController,),
              10.heightBox,
              AppStyles.bold(title: "Full Name"),
              CustomTextField(hint: "Enter Full Name",textController: controller.appNameController,),
              10.heightBox,
              AppStyles.bold(title: "Message"),
              CustomTextField(hint: "Enter Your Message",textController: controller.appMessageController,),
              10.heightBox,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(()=>Padding(
          padding: const EdgeInsets.all(10.0),
          child:controller.isLoading.value? 
          const Center(child: CircularProgressIndicator(),
          ):
           CustomButton(
            buttonText: "Book an appoinment",
            onTap: () async {
              await controller.bookAppoinment(docId,docName, context);
              
            },
          ),
        ),
      ),
    );
  }
}
