import 'dart:ffi';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/cubits/home/Home_State.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<ClothesModel> clothes=[];
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(LoadingState());


  List<ClothesModel> clothesList = [];
  List<ClothesModel> filteredClothesList=[];
  int activeIndex=0;
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

      filteredClothesList = clothesList.where((item) => item.isNew).toList();
      print("Filtered clothes: $filteredClothesList");

      emit(LoadedState(clothesList,filteredClothesList));

    }catch(e){
      print(e);
    }

  }

  void filterForNew() {
    filteredClothesList=clothesList.where((item)=> item.isNew==true).toList();
    activeIndex=0;
    emit(LoadedState(clothesList, filteredClothesList));
  }

  void filterForTrending() {
    filteredClothesList=clothesList.where((item)=> item.isTrending==true).toList();
    activeIndex=1;
    emit(LoadedState(clothesList, filteredClothesList));
  }

  void filterForRecent() {
    activeIndex=2;
    filteredClothesList=clothesList.where((item)=> item.isRecent==true).toList();
    emit(LoadedState(clothesList, filteredClothesList));
  }
}

class ClothesModel {
  int clothesId;
  String clothesName;
  String clothesCompany;
  bool isNew;
  bool isTrending;
  bool isRecent;
  int quantity;
  double price;
  int stock;
  int totalStock;
  String clothesImage;
  bool isFavorite;

  ClothesModel(
    this.clothesId,
    this.clothesName,
    this.clothesCompany,
    this.isNew,
    this.isTrending,
    this.isRecent,
    this.quantity,
    this.price,
    this.stock,
    this.totalStock,
    this.clothesImage,
    this.isFavorite
  );
}
