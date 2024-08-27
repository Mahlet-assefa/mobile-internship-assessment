import 'dart:io';

import 'package:assesment_project/core/error/exception.dart';
import 'package:assesment_project/core/error/failure.dart';
import 'package:assesment_project/core/network/network.dart';
import 'package:assesment_project/data/datasources/local_datasource.dart';
import 'package:assesment_project/data/datasources/remote_datasource.dart';
import 'package:assesment_project/domain/entity/grocery.dart';
import 'package:assesment_project/domain/repository/grocery_repository.dart';
import 'package:dartz/dartz.dart';

class GroceryRepositoryImpl extends GroceryRepository {
  final GroceryRemoteDataSources groceryRemoteDataSources;
  late NetworkInfo networkInfo;
  late LocalDataSource localDataSources;

  GroceryRepositoryImpl(
      {required this.groceryRemoteDataSources,
      required this.localDataSources,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<Grocery>>> getAllgrocery() async {
    List<Grocery> grocerys = [];
    try {
      if (await networkInfo.isConnected) {
        final cacheGrocerys = await groceryRemoteDataSources.getAllgrocery();
        localDataSources.cacheGrocerys(cacheGrocerys);
        grocerys = cacheGrocerys.map((model) => model.toEntity()).toList();
        return Right(grocerys);
      } else {
        grocerys = localDataSources
            .getAllgrocery()
            .map((model) => model.toEntity())
            .toList();
        return Right(grocerys);
      }
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect'));
    }
  }

  @override
  Future<Either<Failure, Grocery>> getGrocery(String id) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await groceryRemoteDataSources.getGrocery(id);
        return Right(result);
      } else {
        // return localDataSource.getLastProducts();
        return const Left(ConnectionFailure('No internet connection'));
      }
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
