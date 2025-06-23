import 'package:ecommerce_flutter/screens/Cart_Screen.dart';

abstract class CartsState{}

class LoadingState extends CartsState{}

class LoadedState extends CartsState{
  final List<ViewType> listOfCarts;
  double totalPriceOfItems;
  LoadedState(this.listOfCarts,this.totalPriceOfItems);
}

