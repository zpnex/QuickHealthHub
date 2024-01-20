import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sampleapp/consts/consts.dart';
import 'package:sampleapp/consts/lists.dart';
import 'package:sampleapp/controllers/home_controller.dart';
import 'package:sampleapp/resources/components/customTextField.dart';
import 'package:sampleapp/views/category_details_view/CategoryDetailsView.dart';
import 'package:sampleapp/views/doctor_profile_view/DoctorProfileView.dart';
import 'package:sampleapp/views/search_view/SearchView.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(
          title: "${AppStrings.welcome} User",
          color: AppColors.whiteColor,
          size: AppSizes.size20,
        ),
        backgroundColor: AppColors.blueColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              height: 100,
              color: AppColors.blueColor,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      textController: controller.searchQueryController,
                      hint: AppStrings.search,
                      boaderColor: AppColors.whiteColor,
                      textColor: AppColors.whiteColor,
                      inputColor: AppColors.whiteColor,
                    ),
                  ),
                  10.widthBox,
                  IconButton(
                    onPressed: () {
                      Get.to(() => SearchView(
                          SearchQuery: controller.searchQueryController.text));
                    },
                    icon: const Icon(Icons.search),
                    color: AppColors.whiteColor,
                  )
                ],
              ),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => CategoryDetailsView(
                                catName: iconsTitleList[index]));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.blueColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(right: 8),
                            height: 20,
                            width: 90,
                            child: Column(
                              children: [
                                Image.asset(
                                  iconList[index],
                                  width: 30,
                                  color: AppColors.whiteColor,
                                ),
                                5.heightBox,
                                AppStyles.normal(
                                  title: iconsTitleList[index],
                                  color: AppColors.whiteColor,
                                  size: AppSizes.size14,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  20.heightBox,
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppStyles.bold(
                      title: "Doctors",
                      color: AppColors.blueColor,
                      size: AppSizes.size18,
                    ),
                  ),
                  10.heightBox,
                  FutureBuilder<QuerySnapshot>(
                    future: controller.getDoctorList(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        var data = snapshot.data?.docs;

                        return SizedBox(
                          height: 150,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: data?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              var docData =
                                  data![index].data() as Map<String, dynamic>;

                              if (docData.containsKey('docName') &&
                                  docData.containsKey('docCategory')) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() =>
                                        DoctorProfileView(doc: data[index]));
                                  },
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      color: AppColors.bgDarkColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    margin: const EdgeInsets.only(right: 8),
                                    height: 100,
                                    width: 100,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 150,
                                          alignment: Alignment.center,
                                          color: AppColors.blueColor,
                                          child: Image.asset(
                                            AppAssets.loginDoctor,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        5.heightBox,
                                        AppStyles.normal(
                                          title: docData['docName'],
                                        ),
                                        5.heightBox,
                                        AppStyles.normal(
                                          title: docData['docCategory'],
                                          color: Colors.black54,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  child: Text(
                                      'Missing required fields in document at index $index'),
                                );
                              }
                            },
                          ),
                        );
                      }
                    },
                  ),
                  5.heightBox,
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AppStyles.normal(
                        title: "View All",
                        color: AppColors.blueColor,
                      ),
                    ),
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => Container(
                        decoration: BoxDecoration(
                          color: AppColors.blueColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Image.asset(
                              AppAssets.icBrain,
                              width: 25,
                              color: AppColors.whiteColor,
                            ),
                            5.heightBox,
                            AppStyles.normal(
                              title: "Lab Test",
                              color: AppColors.whiteColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
