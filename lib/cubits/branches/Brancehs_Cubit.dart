import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/cubits/branches/Branches_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/Branches_Screen.dart';

class BranchesCubit extends Cubit<BranchesState> {
  BranchesCubit() : super(LoadingState());

  final Dio dio = Dio();
  List<BranchData> branchesList = [];

  Future<void> fetchBranches() async {
    try {
      final response = await dio.get(
        "http://localhost:8080/ecommerceApi/allBranches",
      );
      print(response);

      final data = response.data as List;
      branchesList =
          data
              .map(
                (item) => BranchData(
                  item['branchName'] ?? '',
                  item['branchNumberFirst'] ?? '',
                  item['branchNumberSecond'] ?? '',
                ),
              )
              .toList();

      emit(LoadedState(branchesList));
    } catch (e) {
      print("Error fetching branches: $e");
    }
  }
}
