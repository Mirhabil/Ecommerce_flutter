import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/cubits/favorites/Favorites_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/Home_Cubit.dart';

class FavoritesCubit extends Cubit<FavoritesState>{
  FavoritesCubit() : super(LoadingState());

  List<ClothesModel> clothesList = [];
  Dio dio = Dio();

  Future<void> fetchClothes() async {
    try{
      final response=await dio.get("http://localhost:8080/ecommerceApi/allClothes");

      print(response);

      final data=response.data as List;

      clothesList=data.map((item)=> ClothesModel(
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
          item['favorite']

      )).toList();

      print("Main List: $clothesList");

      clothes=clothesList.where((item)=> item.isFavorite==true).toList();


      emit(LoadedState(clothes));
      print("Doneeeeeeee");

    }catch(e){
      print(e);
    }

  }


}