import 'package:assesment_project/core/error/failure.dart';
import 'package:assesment_project/domain/entity/grocery.dart';
import 'package:assesment_project/domain/repository/grocery_repository.dart';
import 'package:dartz/dartz.dart';

class GetGroceryUseCase{
  final GroceryRepository groceryRepository;
  GetGroceryUseCase(this.groceryRepository);

  Future <Either<Failure,Grocery>> call(String id){
    return groceryRepository.getGrocery(id);
  }
}