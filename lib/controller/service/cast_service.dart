import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:trogon_task/model/cast_model.dart';

// class CastService {
//   static Future<CastModel>?> getCategeryImpl() async {
//     try {
//       var res = await Dio().get('news-and-blogs');
//       CastModel castModel = CastModel.fromJson(res.data);
//       log("msg : ${res.data}");
//       return CastModel.blogsCast;
//       // ignore: deprecated_member_use
//     } on DioError catch (e) {
//       log("msg : ${e.message}");
//       log("msg : ${e.error}");
//     } catch (e) {
//       log("msg : $e");
//     }
//     return null;
//   }
// }

class CastService {
  static Future<List<CastModel>> getCastImpl({required int id}) async {
    try {
      var res = await Dio().get('https://api.tvmaze.com/shows/$id/cast');
      print('get id :  $id');
      List<CastModel> castModel = castModelFromJson(jsonEncode(res.data));
      // List<castModel> castModels = castModel.fromJson(res.data) as List<castModel>;
      log("msg cast : ${res.data}");
      print('cast ${res.data}');
      return castModel;
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
