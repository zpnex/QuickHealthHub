import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qhhub/consts/consts.dart';

import '../doctor_profile_view/DoctorProfileView.dart';

class SearchView extends StatelessWidget {
  final String SearchQuery;
  const SearchView({super.key, required this.SearchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(
            title: "Search Results",
            color: AppColors.whiteColor,
            size: AppSizes.size20),
        backgroundColor: AppColors.blueColor,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('doctors').get(),
        // future: FirebaseFirestore.instance.collection('doctors').get(),
        // future: FirebaseFirestore.instance
        //     .collection('doctors')
        //     .where('docCategory', isEqualTo: catName)
        //     .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 170,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemBuilder: (context, index) {
                  var doc = snapshot.data!.docs[index];
                  

                  return !(doc['docName'].toString().toLowerCase()).contains(SearchQuery.toLowerCase())
                      ? const SizedBox.shrink()
                      : GestureDetector(
                        onTap: (){
                          Get.to(() => DoctorProfileView(doc : doc ));
                                         
                        },
                        child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                color: AppColors.bgDarkColor,
                                borderRadius: BorderRadius.circular(12)),
                            margin: const EdgeInsets.only(right: 8),
                            //color: Colors.red,
                            height: 100,
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  color: AppColors.blueColor,
                                  child: Image.asset(
                                    AppAssets.loginDoctor,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                5.heightBox,
                                AppStyles.normal(title: doc['docName']),
                                5.heightBox,
                                VxRating(
                                  selectionColor: AppColors.yellowColor,
                                  onRatingUpdate: (value) {},
                                  maxRating: 5,
                                  count: 5,
                                  value:
                                      double.parse(doc['docRating'].toString()),
                                  stepInt: true,
                                )
                              ],
                            ),
                          )
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
