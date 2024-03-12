import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:trogon_task/model/home_model.dart';

class HomeService {
  static Future<List<HomeModel>> getHomeImpl() async {
    try {
      var res = await Dio().get('https://api.tvmaze.com/shows');
      List<HomeModel> homeModel = homeModelFromJson(jsonEncode(res.data));
      // List<HomeModel> homeModels = HomeModel.fromJson(res.data) as List<HomeModel>;
      log("msg : ${res.data}");
      return homeModel;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log("msg : ${e.message}");
      log("msg : ${e.error}");
    } catch (e) {
      log("msg : $e");
    }
    return [];
  }
}
