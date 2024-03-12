import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_task/controller/service/cast_service.dart';
import 'package:trogon_task/model/cast_model.dart';

class CastController extends GetxController {
  RxList<CastModel> castModel = <CastModel>[].obs;
  RxBool loding = true.obs;

  Future<List<CastModel>?> getCasteScreen({required int id}) async {
    try {
      var castData = await CastService.getCastImpl(id: id);
      loding.value = false;
      print("${castData} ===================================");
      print("111111111111111111111111");
      castModel.value = castData;
      return castData;
    } on DioError catch (e) {
      print(e.response!.data);
      print(e.error);
      print(e.message);
    } catch (e) {
      Get.snackbar('oopz', ' $e');

      print(e);

      print('catch bloc called');

      loding.value = false;
    }
    return null;
  }

  // @override
  // void onInit() {
  //   getHomeScreen().then((value) => homeModel.value = value!);
  //   super.onInit();
  // }
}
