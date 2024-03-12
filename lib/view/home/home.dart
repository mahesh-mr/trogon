import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trogon_task/config/string.dart';
import 'package:trogon_task/controller/controller/home_controller.dart';
import 'package:trogon_task/controller/service/cast_service.dart';
import 'package:trogon_task/controller/service/home_service.dart';
import 'package:trogon_task/view/details_page/details_page.dart';
import 'package:trogon_task/view/home/widget/home_grid.dart';

import '../../config/colors.dart';
import '../../controller/service/navigation_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(HomeController());
    return Scaffold(
    
      backgroundColor: appBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBackground,
        title: Container(
          height: size.height * 0.03,
          width: size.width * 0.3,
          child: Image.asset(appLogo),
        ),
        actions: [
          const Icon(
            CupertinoIcons.search,
            color: appaccuaBlue,
          ),
          SizedBox(width: size.width * 0.06),
        ],
      ),
      body: Obx(() {
        if (controller.loding.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: appaccuaBlue,
          ));
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 5,
                mainAxisExtent: 220,
                crossAxisSpacing: 13,
                mainAxisSpacing: 12),

            itemCount: controller.homeModel.length, // total number of items
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  push(
                    context,
                    DetailsPage(
                      index: index,
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: SizedBox(
                    height: size.height * 0.12,
                    width: size.width * 0.5,
                    child: Image.network(
                      controller.homeModel[index].image!.original!,
                      fit: BoxFit.fill,
                      height: size.height * 0.15,
                      width: size.width * 0.7,
                    ),
                  ),
                ),
                // child: CustomProductItemGridWidget(
                //   height: size.height * 0.195,
                //   width: size.width * 0.8,
                //   imagePath: controller.jersey[index],
                //   size: size,
                //   content: 'Real Madrid Home 2014-15 Ronaldo Embroidery',
                //   discount: ' (20% off)',
                //   oldPrice: '  599.00',
                //   price: '429.00',
                // ),
              );
            },
          ),
        );
      }),
    );
  }
}
