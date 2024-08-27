import 'package:assesment_project/domain/entity/grocery.dart';
import 'package:assesment_project/domain/entity/option.dart';

class GroceryModel extends Grocery {
  const GroceryModel({
      required String id,
      required String title,
      required String image,
      required double rating,
      required double price,
      required double discount,
      required String description,
      required List<Option> options, // Update the type to List<Option>
    }) : super(
              title: title,
              id: id,
              description: description,
              image: image,
              price: price,
              rating:rating,
              discount: discount,
              options: options);

  factory GroceryModel.fromJson(Map<String, dynamic> json) => GroceryModel(
      title: json['title'],
      id: json['id'],
      image: json['imageUrl'],
      price: (json['price']).toDouble(),
      description: json['description'],
      rating: (json['rating']).toDouble(),
      discount: (json['discount']).toDouble(),
      options: (json['options'] as List)
          .map((item) => Option.fromJson(item))
          .toList(),
      );
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': image,
      'rating': rating,
      'discount': discount,
      'options': options.map((option) => option.toJson()).toList(),
    };
  }

  Grocery toEntity() => Grocery(
      title: title,
      id: id,
      description: description,
      image: image,
      price: price,
      rating: rating,
      discount: discount,
      options: options);
}
