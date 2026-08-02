import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Serives/api_service.dart';
import '../../model/product_model.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial() as ProductState);

  final ApiService apiService = ApiService();

  Future<void> getProducts(String category) async {
    emit(ProductLoading() as ProductState);

    try {
      final response = await apiService.getProductsByCategory(category);

      List<ProductModel> products = [];

      for (var item in response.data["products"]) {
        products.add(ProductModel.fromJson(item));
      }

      emit(ProductSuccess(products) as ProductState);
    } catch (e) {
      emit(ProductError(e.toString()) as ProductState);
    }
  }
}