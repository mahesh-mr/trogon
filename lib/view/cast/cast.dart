// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_task/config/colors.dart';
import 'package:trogon_task/controller/service/navigation_service.dart';
import 'package:trogon_task/view/cast/cast_details.dart';
import 'package:trogon_task/view/cast/widget/cast_tail.dart';

import '../../controller/controller/cast_controller.dart';

class Cast extends StatefulWidget {
  const Cast({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  State<Cast> createState() => _CastState();
}

class _CastState extends State<Cast> {
  final controller = Get.put(CastController());

  @override
  void initState() {
    controller.getCasteScreen(id: widget.id);
 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: appBackground,
        appBar: AppBar(
          backgroundColor: appBackground,
          elevation: 0,
          leading: IconButton(
            onPressed: () {  Navigator.pop(context);},
            icon: const Icon(
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

          return ListView.separated(
              itemBuilder: (context, index) {
                final data = controller.castModel[index];
                return CastTail(
                  size: size,
                  images: data.person!.image!.medium!,
                  realNmae: data.person!.name!,
                  charetorName: data.character!.name!,
                  onTap: () {
                    push(context, CastDetails(id:widget .id ,index:index ,));
                  },
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: size.height * 0.02,
                  ),
              itemCount: controller.castModel.length);
        }));
  }
}
