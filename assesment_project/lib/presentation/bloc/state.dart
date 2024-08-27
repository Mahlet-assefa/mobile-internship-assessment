import 'package:assesment_project/domain/entity/grocery.dart';

abstract class GroceryState {}
class InitialState extends GroceryState {}


class LoadingState extends GroceryState {}
class LoadedState extends GroceryState {
  final List<Grocery> grocerys;

  LoadedState(this.grocerys);
}

class GetAllGroceryState extends GroceryState {
  final List<Grocery> grocery;

  GetAllGroceryState(this.grocery);
}

class GetGroceryState extends GroceryState {
  final Grocery grocery;

  GetGroceryState(this.grocery);
}

class ErrorState extends GroceryState {
  final String message;

  ErrorState(this.message);
}

class SuccessState extends GroceryState {
  final String message;

  SuccessState(this.message);
}


