//ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../models/productData.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: ProductsData.favoriteList.length,
          itemBuilder: (_ctx, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    title: Text(ProductsData.favoriteList[index].title),
                    leading: SizedBox.square(
                      dimension: 50,
                      child: Image.network(
                        ProductsData.favoriteList[index].image,
                        errorBuilder: (_ctx, value, error) =>
                            const Placeholder(),
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {});
                          ProductsData.favoriteList[index].switchFavorite();
                        },
                        icon: const Icon(Icons.favorite, color: Colors.amber))),
              )),
    );
  }
}
