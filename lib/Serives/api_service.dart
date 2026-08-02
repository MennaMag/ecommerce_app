import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://dummyjson.com/",
    ),
  );

  Future<Response> getCategories() async {
    return await dio.get("products/categories");
  }

  Future<Response> getProductsByCategory(String category) async {
    return await dio.get("products/category/$category");
  }
}