import 'package:ecommerce_flutter/cubits/home/Home_Cubit.dart';

abstract class ProductsState{}

class LoadingState extends ProductsState{}
class LoadedState extends ProductsState{
  // bool favoriteLoad;
  // LoadedState(this.favoriteLoad);
  ClothesModel clothes;
  LoadedState(this.clothes);
}
