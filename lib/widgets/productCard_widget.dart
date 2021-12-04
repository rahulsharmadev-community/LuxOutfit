//ignore_for_file: file_names

import 'dart:math';
import 'package:flutter/material.dart';
import '../routes/product_route.dart';
import '../models/product.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  const ProductCardWidget(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,MaterialPageRoute(
          builder: (builder) => ProductRoute(product: product))),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                product.image,
                errorBuilder: (_ctx, value, error) => const Center(
                  child: Placeholder(
                    fallbackHeight: 100,
                    fallbackWidth: 100,
                  ),
                ),
              ),
              Row(
                children: List.generate(
                    2 + Random().nextInt(3),
                    (index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        )),
              ),
              Text(product.title, maxLines: 2),
              RichText(
                  text: TextSpan(
                      text: '₹${product.amount} ',
                      style: const TextStyle(
                          fontSize: 17,
                          color: Colors.red,
                          fontWeight: FontWeight.w500),
                      children: [
                    TextSpan(
                      text: '${product.amount + 100}',
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2.5,
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    )
                  ]))
            ],
          ),
          StatefulBuilder(builder: (context, setState) {
            return Positioned(
              bottom: 70,
              right: 0,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                mini: true,
                onPressed: () {
                  setState(() {});
                  product.switchFavorite();
                },
                child: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: product.isFavorite ? Colors.amber : Colors.grey,
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
