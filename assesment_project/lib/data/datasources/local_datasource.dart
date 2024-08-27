import 'dart:convert';

import 'package:assesment_project/data/models/grocery_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  List<GroceryModel> getAllgrocery();
  GroceryModel getGrocery(String id);
  Future<void> cacheGrocerys(List<GroceryModel> cacheGrocerys);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  var keyName = 'cache';
  LocalDataSourceImpl({required this.sharedPreferences});

  List<GroceryModel> _toGroceryModelList(String? response) {
    List<GroceryModel> productModels = [];
    if (response != null) {
      var jsonList = json.decode(response);
      for (var data in jsonList) {
        productModels.add(GroceryModel.fromJson(data));
      }

      return productModels;
    }
    return [];
  }

  @override
  Future<void> cacheGrocerys(List<GroceryModel> cacheGrocerys) async {
    var mapped = cacheGrocerys.map((model) => (model.toJson())).toList();
    var jsonMap = json.encode(mapped);
    bool response = await sharedPreferences.setString(keyName, jsonMap);

    if (response == false) {
      throw Exception('Error');
    }
  }

  @override
  List<GroceryModel> getAllgrocery() {
    var response = sharedPreferences.getString(keyName);
    if (response != null) {
      final groceryModels = _toGroceryModelList(response);
      return groceryModels;
    }
    throw Exception('Cache Missed');
  }

  @override
  GroceryModel getGrocery(String id) {
    var response = sharedPreferences.getString(keyName);
    if (response != null) {
      final groceryModels = _toGroceryModelList(response);
      for (var groceryModel in groceryModels) {
        if (groceryModel.id == id) {
          return groceryModel;
        }
      }
      throw Exception('No grocery Found with this ID');
    }
    throw Exception('Problem with shared preference');
  }
}
