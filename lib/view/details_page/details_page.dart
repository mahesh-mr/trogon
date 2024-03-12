// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:trogon_task/config/fonts.dart';
import 'package:trogon_task/controller/controller/home_controller.dart';
import 'package:trogon_task/controller/service/navigation_service.dart';
import 'package:trogon_task/view/cast/cast.dart';

import '../../config/colors.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: appBackground,
      appBar: AppBar(
        backgroundColor: appBackground,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: appaccuaBlue,
          ),
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
        final data = controller.homeModel[index];
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.4,
                width: double.infinity,
                // color: Colors.amber,
                child: Image.network(
                  data.image!.original!,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      data.name!,
                      style: white24W500,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.globe,
                              color: appWhiteshade,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              data.language!,
                              style: white15W500,
                            ),
                          ],
                        ),
                        Text(
                          ' ${data.runtime}m',
                          style: white15W500,
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Wrap(
                        runSpacing: size.height * 0.02,
                        children: List.generate(3, (idx) {
                          final length = data.genres![idx];

                          return Container(
                            margin: EdgeInsets.only(right: size.width * 0.02),
                            height: size.height * 0.045,
                            width: length.length <= 6
                                ? size.width * 0.25
                                : size.width * 0.35,
                            decoration: BoxDecoration(
                                //  color: appWhiteshade,
                                borderRadius: BorderRadius.circular(30.r),
                                border: Border.all(color: appWhiteshade)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                data.genres![idx],
                                style: white15W500,
                              ),
                            ),
                          );
                        })),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        const Icon(
                          CupertinoIcons.star_fill,
                          color: appYellow,
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          data.rating!.average!.toString(),
                          style: white15W500,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      child: Text(
                        data.summary!,
                        maxLines: 54,
                        style: white16normal,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        push(
                            context,
                            Cast(
                              id: data.id!,
                            ));
                      },
                      child: Container(
                        height: size.height * 0.06,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: appWhiteshade,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: appWhiteshade)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'cast',
                            style: black15W500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
