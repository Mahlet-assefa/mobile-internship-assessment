import 'package:assesment_project/core/error/failure.dart';
import 'package:assesment_project/domain/entity/grocery.dart';
import 'package:dartz/dartz.dart';

abstract class GroceryRepository{
  Future<Either<Failure, List<Grocery>>> getAllgrocery();
  Future <Either<Failure, Grocery>> getGrocery(String id);
  
}


