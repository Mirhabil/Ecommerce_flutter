import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/cubits/category/Category_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/Home_Cubit.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(LoadingState());

  int activeIndex=0;

  List<CategoryModel> categoryList = [];
  final dio = Dio();

  Future<void> fetchCategories() async {
    try {
      final response = await dio.get(
        "http://localhost:8080/ecommerceApi/allCategory",
      );
      print(response);
      final data = response.data as List;

      categoryList = data.map((item) {
        final clothesJsonList = item['clothesList'] as List<dynamic>? ?? [];
        final clothes = clothesJsonList.map((clothesItem) {
          return ClothesModel(
            clothesItem['clothesId'] ?? 0,
            clothesItem['clothesName'] ?? '',
            clothesItem['clothesCompany'] ?? '',
            clothesItem['isNew'] ?? false,
            clothesItem['isTrending'] ?? false,
            clothesItem['isRecent'] ?? false,
            clothesItem['quantity'] ?? 0,
            (clothesItem['price'] ?? 0).toDouble(),
            clothesItem['stock'] ?? 0,
            clothesItem['totalStock'] ?? 0,
            clothesItem['clothesImage'] ?? '',
            clothesItem['favorite']
          );
        }).toList();

        return CategoryModel(
          item['id'] ?? 0,
          item['categoryName'] ?? "",
          clothes,
        );
      }).toList();

      emit(LoadedState(categoryList,activeIndex));
    } catch (e) {
      print("ErrorMessage: $e");
    }
  }

  void chipClicked(int index){
    activeIndex=index;
    emit(LoadedState(categoryList, activeIndex));

  }

}
