//ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../models/productData.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: ProductsData.categoryList.length,
          itemBuilder: (_ctx, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(ProductsData.categoryList[index].title),
                  trailing: SizedBox.square(
                    dimension: 50,
                    child: Image.network(
                      ProductsData.categoryList[index].image,
                      errorBuilder: (_ctx, value, error) => const Placeholder(),
                    ),
                  ),
                ),
              )),
    );
  }
}
