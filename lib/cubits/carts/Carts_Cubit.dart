import 'dart:ffi';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/cubits/carts/Carts_State.dart';
import 'package:ecommerce_flutter/cubits/home/Home_Cubit.dart';
import 'package:ecommerce_flutter/screens/Cart_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartsCubit extends Cubit<CartsState>{
  CartsCubit():super(LoadingState());
  
  Dio dio=Dio();
  List<ViewType> listForChart=[];

  void incrementCount(int index) {
    final currentState = state;
    if (currentState is LoadedState &&
        currentState.listOfCarts[index] is CartItemClass) {

     // final items = List<ViewType>.from(currentState.listOfCarts);
      final item = currentState.listOfCarts[index] as CartItemClass;
      item.count++;
      emit(LoadedState(currentState.listOfCarts));
    }
  }

  void decrementCount(int index) {
    final currentState = state;
    if (currentState is LoadedState &&
        currentState.listOfCarts[index] is CartItemClass) {
      final items = List<ViewType>.from(currentState.listOfCarts);
      final item = items[index] as CartItemClass;
      if (item.count > 0) item.count--;
      emit(LoadedState(items));
    }
  }
  
  Future<void> fetchListForChart () async{
    final response=await dio.get("http://localhost:8080/ecommerceApi/allClothes");
    final data=response.data;

    List<ClothesModel> responseList = List<ClothesModel>.from(
      data.map((item) => ClothesModel.fromJson(item)),
    );

    List<ClothesModel> filteredResponseList=responseList.where((item)=> item.isAddedToChart==true).toList();

    for(final i in filteredResponseList){
      listForChart.add(CartItemClass("Yellow", i.price, i.quantity, i.count,i.clothesImage,i.clothesId));
    }
    listForChart.add(ButtonClass("Buy Now"));

    emit(LoadedState(listForChart));
  }

}