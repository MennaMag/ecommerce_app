import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Serives/api_service.dart';
import '../../model/category_model.dart';
import '../../services/api_service.dart';
import 'category_state.dart';
class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  final ApiService apiService = ApiService();
  Future<void> getCategories() async {
    emit(CategoryLoading());
    try {
      final response = await apiService.getCategories();

      List<CategoryModel> categories = [];

    for (var item in response.data) {
    categories.add(CategoryModel.fromJson(item));
    }

    emit(CategorySuccess(categories));
    } catch (e) {
    emit(CategoryError(e.toString()));
    }
  }
}