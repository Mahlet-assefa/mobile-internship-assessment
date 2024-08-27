import 'package:assesment_project/core/error/failure.dart';
import 'package:assesment_project/domain/entity/grocery.dart';
import 'package:assesment_project/domain/repository/grocery_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllGroceryUseCase{

  final GroceryRepository groceryRepository;
  GetAllGroceryUseCase(this.groceryRepository);


  Future <Either<Failure, List<Grocery>>> execute(){
    return groceryRepository.getAllgrocery();
  }
}