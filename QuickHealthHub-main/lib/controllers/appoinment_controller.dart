import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:qhhub/consts/consts.dart';

class AppoinmentController extends GetxController {
  var isLoading = false.obs;

  var appDayController = TextEditingController();
  var appTimeController = TextEditingController();
  var appMobileController = TextEditingController();
  var appNameController = TextEditingController();
  var appMessageController = TextEditingController();

 

  bookAppoinment(String docId,String docName, context) async {
    isLoading(true);

    var store = FirebaseFirestore.instance.collection('appoinments').doc();
    await store.set({
      'appBy': FirebaseAuth.instance.currentUser?.uid,
      'appDay': appDayController.text,
      'appTime': appTimeController.text,
      'appMobile': appMobileController.text,
      'appName': appNameController.text,
      'appMsg': appMessageController.text,
      'appWith': docId,
      'appWithName': docName,
    });

    isLoading(false);
    VxToast.show(context, msg: "Appoinment is booked successfully!");
    Get.back();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAppoinments() {
    return FirebaseFirestore.instance.collection('appoinments').get();
  }
}
