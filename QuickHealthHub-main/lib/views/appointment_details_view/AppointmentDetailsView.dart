import 'package:cloud_firestore/cloud_firestore.dart';

import '../../consts/consts.dart';

class AppointmentDetailsView extends StatelessWidget {
  final DocumentSnapshot doc;

  const AppointmentDetailsView({super.key,required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(
          title: doc['appWithName'],
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
            AppStyles.normal(title: doc['appDay']),
            10.heightBox,
            AppStyles.bold(title: "Select Appointment Time"),
            AppStyles.normal(title: doc['appTime']),
            10.heightBox,
            AppStyles.bold(title: "Mobile Number"),
            AppStyles.normal(title: doc['appMobile']),
            10.heightBox, 
            AppStyles.bold(title: "Full Name"),
            AppStyles.normal(title:doc['appName']),
            10.heightBox,
            AppStyles.bold(title: "Message"),
            AppStyles.normal(title: doc['appMsg']),
            10.heightBox,
          ],
        ),
      ),
    );
  }
}
