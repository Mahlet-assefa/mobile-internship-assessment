import 'package:assesment_project/domain/entity/option.dart';
import 'package:equatable/equatable.dart';

class Grocery  extends Equatable {
  const Grocery ({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.price,
    required this.discount,
    required this.description,
    required this.options,
  });

  final String id;
  final String title;
  final String image;
  final double rating;
  final double price;
  final double discount;
  final String description;
  final List<Option> options;

  @override
  List<Object?> get props =>
      [id, title, image, rating, price, discount, description, options];
}
