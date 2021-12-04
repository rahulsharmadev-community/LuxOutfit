//ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/productCard_widget.dart';
import '../models/productData.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.all(8.0),
            height: 150,
            width: double.maxFinite,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://i.pinimg.com/564x/99/03/65/9903655ef0248d6e7aff24abe8cefb87.jpg')))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Categories',
            style: Theme.of(context).primaryTextTheme.headline6,
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ProductsData.categoryList.length,
              itemBuilder: (itemBuilder, index) => Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    constraints: BoxConstraints.loose(const Size.square(100)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(
                              ProductsData.categoryList[index].image),
                          colorFilter: const ColorFilter.mode(
                              Colors.black26, BlendMode.srcATop),
                        )),
                    child: Text(
                      ProductsData.categoryList[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  )),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Featured',
              style: Theme.of(context).primaryTextTheme.headline6,
            )),
        GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            shrinkWrap: true,
            itemCount: ProductsData.productList.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5 / 8,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 8.0),
            itemBuilder: (_ctx, index) => ProductCardWidget(
                ProductsData.productList[index],
                key: Key('$index')))
      ],
    );
  }
}
