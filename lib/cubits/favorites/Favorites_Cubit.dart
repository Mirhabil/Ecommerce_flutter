import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/cubits/favorites/Favorites_State.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/Home_Cubit.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(LoadingState());

  Dio dio = Dio();

  //--  JIT & AOT Compiling

  Future<void> fetchClothes() async {
    debugPrint('is here');
    try {
      final response = await dio.get(
        "http://localhost:8080/ecommerceApi/allClothes",
      );

      final data = response.data as List;

      List<ClothesModel> clothesList =
          data
              .map(
                (item) => ClothesModel(
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
                  item['favorite'],
                  item['itemCount'] ?? 0,
                  item['addedToChart'],
                ),
              )
              .toList();

      final favList = clothesList.where((e) => e.isFavorite == true).toList();

      if (favList.isEmpty) {
        emit(EmptyListState());
      } else {
        print("Doneeeeeeee ${favList.length}");
        emit(LoadedState(favList));
      }
    } catch (e) {
      print(e);
    }
  }
}
