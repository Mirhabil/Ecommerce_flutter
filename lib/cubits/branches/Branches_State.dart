import '../../screens/Branches_Screen.dart';

abstract class BranchesState {}

class LoadingState extends BranchesState {}

class LoadedState extends BranchesState {

  List<BranchData> branchData;
  LoadedState(this.branchData);
}
