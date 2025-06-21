import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/cubits/products/Products_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState>{
  ProductsCubit():super(LoadedState());


  void showTheData(){

  }

  Future<void> updateFavorite(int id, bool isFavorite) async {
    Dio dio = Dio();
    try {
      print("Succesful Put Request isFav: $isFavorite");
      print("Succesful Put Request id: $id");
      final response = dio.put(
        "http://localhost:8080/ecommerceApi/updateClothes",
        data: {'clothesId': id},
      );
      print("Succesful Put Request");
    } catch (e) {
      print('Error updating user: $e');
    }
  }
}