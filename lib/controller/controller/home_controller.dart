import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trogon_task/controller/service/home_service.dart';
import 'package:trogon_task/model/home_model.dart';

class HomeController extends GetxController {
  RxList<HomeModel> homeModel = <HomeModel>[].obs;
  RxBool loding = true.obs;

  Future<List<HomeModel>?> getHomeScreen() async {
    try {
      var homeData = await HomeService.getHomeImpl();
      loding.value = false;

      return homeData;
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

  @override
  void onInit() {
    getHomeScreen().then((value) => homeModel.value = value!);
    super.onInit();
  }
}
