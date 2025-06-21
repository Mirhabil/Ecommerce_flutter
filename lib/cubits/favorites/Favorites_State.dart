import 'package:ecommerce_flutter/cubits/home/Home_Cubit.dart';

abstract class FavoritesState{}

class LoadingState extends FavoritesState{}
class LoadedState extends FavoritesState{
  List<ClothesModel> clothes;
  LoadedState(this.clothes);
}