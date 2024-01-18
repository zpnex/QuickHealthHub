import 'package:get/route_manager.dart';
import 'package:qhhub/consts/consts.dart';
import 'package:qhhub/consts/lists.dart';
import 'package:qhhub/views/category_details_view/CategoryDetailsView.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title:
            AppStyles.bold(title: AppStrings.category, size: AppSizes.size18, color: AppColors.whiteColor,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 200,
          ),
          itemCount: iconList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => CategoryDetailsView(catName : iconsTitleList[index]));
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.bgDarkColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          iconList[index],
                          width: 60,
                          color: Vx.randomPrimaryColor,
                        )),
                    30.heightBox,
                    AppStyles.bold(
                        title: iconsTitleList[index],
                        color: AppColors.textColor,
                        size: AppSizes.size16),
                    10.heightBox,
                    AppStyles.normal(
                        title: "13 specialists",
                        color: AppColors.textColor.withOpacity(0.5),
                        size: AppSizes.size12),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
