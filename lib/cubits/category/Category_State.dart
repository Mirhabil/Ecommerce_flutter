import 'package:ecommerce_flutter/cubits/home/Home_Cubit.dart';

abstract class CategoryState{}

class LoadingState extends CategoryState{}

class LoadedState extends CategoryState{
  List<CategoryModel> categoryList;
  int activeIndex;
  LoadedState(this.categoryList,this.activeIndex);
}


class CategoryModel{

  int categoryId;
  List<ClothesModel> clothes;
  String categoryName;

  CategoryModel(this.categoryId,this.categoryName,this.clothes);
}