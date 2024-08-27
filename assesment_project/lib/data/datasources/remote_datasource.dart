import 'dart:convert';

import 'package:assesment_project/core/error/exception.dart';
import 'package:assesment_project/data/models/grocery_model.dart';
import 'package:http/http.dart' as http;

abstract class GroceryRemoteDataSources {
  Future<List<GroceryModel>>getAllgrocery();
  Future<GroceryModel> getGrocery(String id);
}

class GroceryRemoteDataSourcesImpl extends GroceryRemoteDataSources{
  final http.Client client;
  GroceryRemoteDataSourcesImpl({required this.client});
  final baseurl = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries';
  @override
  Future<List<GroceryModel>> getAllgrocery() async {
    final response = await client.get(
      Uri.parse(baseurl),
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      List<GroceryModel> grocery = [];
      for (var i in jsonData['data']) {
        grocery.add(GroceryModel.fromJson(i));
      }
      print("mia${grocery}");
      return grocery;
    } else {
      throw ServerException('server failure');
    }
  }

  @override
  Future<GroceryModel> getGrocery(String id) async {
    final response = await client.get(
      Uri.parse(baseurl),
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      return GroceryModel.fromJson(jsonData['data']);
    } else {
      throw ServerException('server failure');
    }
  }
}
