import 'package:ecommerce_flutter/cubits/home/Home_Cubit.dart';

abstract class HomeState {}

class LoadingState extends HomeState {}

class LoadedState extends HomeState {
  List<ClothesModel> clothesModel;
  List<ClothesModel> filteredClothesModel;
  LoadedState(this.clothesModel,this.filteredClothesModel);
}

class IsNewClickedState extends HomeState {}

class IsTrendingCLickedState extends HomeState {}

class IsRecentClickedState extends HomeState {}
