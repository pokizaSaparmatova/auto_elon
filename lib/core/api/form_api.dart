import 'package:dars12/core/models/distict_model.dart';
import 'package:dars12/core/models/region_model.dart';
import 'package:dio/dio.dart';

class FormApi {
  final dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 60)));

  Future<List<RegionModel>> regions() async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await dio.get("https://openbudget.uz/api/v1/regions");
    return (response.data["regions"] as List)
        .map((e) => RegionModel.fromJson(e))
        .toList();
  }

  Future<List<DistrictModel>> districts(int regionId) async {
    final response = await dio.get(
      "https://openbudget.uz/api/v1/districts?region_id=$regionId",
    );
    return (response.data["districts"] as List)
        .map((e) => DistrictModel.fromJson(e))
        .toList();
  }

  Future<dynamic> brands() async {
    final response = await dio.get("https://m.avtoelon.uz/avto/brands/");
  }

  Future<dynamic> models(int brandId) async {
    final response =
        await dio.get("https://m.avtoelon.uz/avto/models/$brandId/");
  }
}
