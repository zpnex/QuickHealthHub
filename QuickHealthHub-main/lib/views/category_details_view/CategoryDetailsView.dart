import 'package:qhhub/consts/consts.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

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
          child: GridView.builder(
            itemCount: 10,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 170,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
            itemBuilder: (context, index) {
              return Container(
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
                    AppStyles.normal(title: "Doctor Name"),
                    5.heightBox,
                    VxRating(
                      selectionColor: AppColors.yellowColor,
                      onRatingUpdate: (value) {},
                      maxRating: 5,
                      count: 5,
                      value: 4,
                      stepInt: true,
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
