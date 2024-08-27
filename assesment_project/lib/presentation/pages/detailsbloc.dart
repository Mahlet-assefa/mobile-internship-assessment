import 'package:assesment_project/domain/entity/grocery.dart';
import 'package:assesment_project/domain/usecase/get_a_grocery.dart';
import 'package:assesment_project/domain/usecase/get_all_grocery.dart';
import 'package:assesment_project/presentation/bloc/blocs.dart';
import 'package:assesment_project/presentation/bloc/state.dart';
import 'package:assesment_project/presentation/pages/homebloc.dart';
import 'package:assesment_project/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.grocery});
  final Grocery grocery;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroceryBloc(
        getAllGroceryUseCase: getIt<GetAllGroceryUseCase>(),
        getGroceryUseCase: getIt<GetGroceryUseCase>(),
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width, // Use full width
                      height: 250,
                      child: Image.network(widget.grocery.image,
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                      top: 20,
                      left: 15,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back,
                              size: 18, color: Colors.black),
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Go back to previous page
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border),
                          color: const Color(0XFFFF6347),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title Text
                      Text(
                        widget.grocery.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Price and Discount
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '€${widget.grocery.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              '€${widget.grocery.discount.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFFFF6347),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      // Rating
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.grocery.rating.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "(1.205)",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "see all review",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    widget.grocery.description,
                    style: const TextStyle(color: Color(0xFF666666)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "see more",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0, bottom: 3, left: 10, right: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Add to Basket",
                      style: TextStyle(
                        color: Color.fromARGB(255, 210, 206, 206),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
