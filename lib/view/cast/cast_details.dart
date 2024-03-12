// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:trogon_task/config/colors.dart';
import 'package:trogon_task/config/fonts.dart';

import '../../controller/controller/cast_controller.dart';

class CastDetails extends StatefulWidget {
  const CastDetails({
    Key? key,
    required this.id,
    required this.index,
  }) : super(key: key);
  final int id;
  final int index;
  @override
  State<CastDetails> createState() => _CastDetailsState();
}

class _CastDetailsState extends State<CastDetails> {
  final controller = Get.put(CastController());

  @override
  void initState() {
    controller.getCasteScreen(id: widget.id);
    print(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(CastController());
    String cdate = DateFormat("dd-MM-yyy")
        .format(controller.castModel[widget.index].person!.birthday!);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appBackground,
      appBar: AppBar(
        backgroundColor: appBackground,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: appaccuaBlue,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.loding.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: appaccuaBlue,
          ));
        }
        final data = controller.castModel[widget.index];
        return Column(
          children: [
            SizedBox(
              height: size.height * 0.6,
              width: double.infinity,
            
              child: Image.network(
                data.character!.image!.original!,
                fit: BoxFit.fitWidth,
                // height: size.height * 0.15,
                // width: size.width * 0.7,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: SizedBox(
                height: size.height * 0.2,
                width: double.infinity,
                // color: Colors.amber,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      //  borderRadius: BorderRadius.circular(10.r),
                      child: SizedBox(
                        height: size.height * 0.17,
                        width: size.width * 0.3,
                        child: Image.network(
                          data.person!.image!.medium!,
                          fit: BoxFit.fill,
                          // height: size.height * 0.15,
                          // width: size.width * 0.7,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: size.width * 0.01,
                    // ),
                    SizedBox(
                        height: size.height * 0.17,
                        width: size.width * 0.6,
                        //color: appWhiteshadeLight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Name : ${data.person!.name!}',
                              style: white16normal,
                            ),
                            Text(
                              'Born : $cdate',
                              style: white16normal,
                            ),
                            Text(
                              'Country : ${data.person!.country!.name!} ',
                              style: white16normal,
                            ),
                            Text(
                              'Gender : ${data.person!.gender!} ',
                              style: white16normal,
                            ),
                            Text(
                              'Death   ',
                              style: white16normal,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
