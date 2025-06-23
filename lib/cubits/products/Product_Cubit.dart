import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/cubits/products/Products_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/Home_Cubit.dart';

class ProductsCubit extends Cubit<ProductsState> {
  //bool favorite;
  ProductsCubit():super(LoadingState());
  List<ClothesModel> clothesList = [];
  List<ClothesModel> filteredClothesList = [];
  int activeIndex = 0;
  Dio dio = Dio();

  Future<void> updateFavorite(int id, bool currentFavorite) async {
    try {
      final updatedFavorite = !currentFavorite;

      final response = await dio.put(
        "http://localhost:8080/ecommerceApi/updateClothes",
        data: {'clothesId': id, 'favorite': updatedFavorite},
      );

      // Re-fetch the updated item
      await fetchClothesById(id);
    } catch (e) {
      print("Error updating favorite: $e");
    }
  }


  Future<void> updateChart(int id, bool currentChart) async {
    try {
      final updatedChart = !currentChart;

      final response = await dio.put(
        "http://localhost:8080/ecommerceApi/updateClothesChart",
        data: {'clothesId': id, 'favorite': updatedChart},
      );

      // Re-fetch the updated item
      await fetchClothesById(id);
    } catch (e) {
      print("Error updating favorite: $e");
    }
  }


  // ProductsCubit({required bool initialFavorite})
  //     : favorite = initialFavorite,
  //       super(LoadedState(initialFavorite));

  // Future<void> updateFavorite(int id, bool isFavorite) async {
  //   try {
  //     print("Sending PUT request isFav: $isFavorite, id: $id");
  //     final response = await dio.put(
  //       "http://localhost:8080/ecommerceApi/updateClothes",
  //       data: {'clothesId': id},
  //     );
  //
  //     bool? updatedFavorite = await fetchClothes(id);
  //     if (updatedFavorite != null) {
  //      // favorite = updatedFavorite;
  //       //emit(LoadedState(favorite));
  //     }
  //
  //     print("Successfully updated favorite");
  //   } catch (e) {
  //     print('Error updating user: $e');
  //   }
  // }
  //
  // Future<bool?> fetchClothes(int id) async {
  //   try {
  //     final response = await dio.get("http://localhost:8080/ecommerceApi/allClothes");
  //     final data = response.data as List;
  //
  //     clothesList = data.map((item) => ClothesModel(
  //       item['clothesId'] ?? 0,
  //       item['clothesName'] ?? '',
  //       item['clothesCompany'] ?? '',
  //       item['new'] ?? false,
  //       item['trending'] ?? false,
  //       item['recent'] ?? false,
  //       item['quantity'] ?? 0,
  //       (item['price'] as num).toDouble(),
  //       item['stock'] ?? 0,
  //       item['totalStock'] ?? 0,
  //       item['clothesImage'] ?? '',
  //       item['favorite'] ?? false,
  //     )).toList();
  //
  //     // Optional: Update filtered list
  //     filteredClothesList = clothesList.where((item) => item.isNew).toList();
  //
  //     // Find item by id
  //     final matched = clothesList.firstWhere(
  //           (item) => item.clothesId == id,
  //       orElse: () => ClothesModel(0, '', '', false, false, false, 0, 0.0, 0, 0, '', false),
  //     );
  //
  //     return matched.isFavorite;
  //   } catch (e) {
  //     print('Error fetching clothes: $e');
  //     return null;
  //   }
  // }

  Future<void> fetchClothesById(int id) async {

    try {
      final response = await dio.get("http://localhost:8080/ecommerceApi/getClothesById/$id");
      final item = response.data;
      print("Itemsssssss: $item");

      ClothesModel result = ClothesModel(
        item['clothesId'] ?? 0,
        item['clothesName'] ?? '',
        item['clothesCompany'] ?? '',
        item['new'] ?? false,
        item['trending'] ?? false,
        item['recent'] ?? false,
        item['quantity'] ?? 0,
        (item['price'] as num).toDouble(),
        item['stock'] ?? 0,
        item['totalStock'] ?? 0,
        item['clothesImage'] ?? '',
        item['favorite'] ?? false,
        item['itemCount'] ?? 0,
        item['addedToChart'] ?? null,
      );

      emit(LoadedState(result));
    } catch (e) {
      print("Error in fetchClothesById: $e");
      // Optionally emit error state if you create one
    }
  }
}
