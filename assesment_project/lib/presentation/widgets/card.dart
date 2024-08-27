import 'package:assesment_project/domain/entity/grocery.dart';
import 'package:assesment_project/presentation/pages/detailsbloc.dart';
import 'package:flutter/material.dart';

class GroceryCard extends StatelessWidget {
  final Grocery grocery;

  const GroceryCard({super.key, required this.grocery});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: () {
              // print('tapped');
              Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DetailPage(grocery: grocery);
                      },
                    ),
                  );
            },  
            
    child:Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 8,
      shadowColor: Colors.grey.withOpacity(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  grocery.image,
                  height: 100, // Adjust height to fit your design
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 120),
                ),
              ),
              Positioned(
                top: 10,
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
                  grocery.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                // const SizedBox(height: 4),
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
                      grocery.rating.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 4),
                // Price and Discount
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        '€${grocery.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                        overflow: TextOverflow.ellipsis, // Handle overflow
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        '€${grocery.discount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFFFF6347),
                        ),
                        overflow: TextOverflow.ellipsis, // Handle overflow
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}
