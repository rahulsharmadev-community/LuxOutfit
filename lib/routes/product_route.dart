import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/productCard_widget.dart';
import '../models/productData.dart';
import '../models/product.dart';

class ProductRoute extends StatelessWidget {
  final Product product;

  const ProductRoute({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget simpleCard(String title, List<Widget> children) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(title,
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline6!
                    .copyWith(color: Colors.grey)),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: children))
          ],
        );
    Container BackgroundBox(
            {required Widget child,
            EdgeInsetsGeometry? padding,
            EdgeInsetsGeometry? margin}) =>
        Container(
            child: child,
            margin: margin ?? const EdgeInsets.only(bottom: 16),
            padding: padding ?? const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3,
                      spreadRadius: 0.1,
                      offset: Offset(0, 1))
                ],
                borderRadius: BorderRadius.circular(15)));
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent),
        bottomNavigationBar: SizedBox(
          height: 42,
          child: Row(
            children: [
              Expanded(child: TextButton(
                  onPressed: () {}, child: const Text('ADD TO CART'))),
              Expanded(
                child: FlatButton(
                  onPressed: (){},
                    color: Colors.amber.shade600,
                    textColor: Colors.white,
                    child: const Text('BUY NOW')),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BackgroundBox(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.maxFinite,
                          child: Image.network(product.image,
                              fit: BoxFit.cover,
                              errorBuilder: (_ctx, value, error) =>
                                  const Placeholder(
                                    fallbackHeight: 100,
                                    fallbackWidth: 100,
                                  )),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  3,
                                  (index) => const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 4.0),
                                        child: CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Colors.white70,
                                        ),
                                      ))),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                                children: List.generate(
                                    2 + Random().nextInt(3),
                                    (index) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 18,
                                        ))),
                          ),
                          Text(product.title,
                              maxLines: 3,
                              style:
                                  Theme.of(context).primaryTextTheme.headline5),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: RichText(
                                text: TextSpan(
                                    text: '₹${product.amount}  ',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline5!
                                        .copyWith(fontWeight: FontWeight.w500),
                                    children: [
                                  TextSpan(
                                    text: '₹${product.amount + 100}',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline5!
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationThickness: 3),
                                  )
                                ])),
                          ),
                          simpleCard(
                              'Colors',
                              <int>[
                                0xff87a96b,
                                0xff89cff0,
                                0xffa1caf1,
                                0xfff4c2c2,
                                0xff21abcd,
                                0xffffe135
                              ]
                                  .map((e) => Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        color: Color(e),
                                        child: const SizedBox.square(
                                            dimension: 50),
                                      ))
                                  .toList()),
                          simpleCard(
                            'Sizes',
                            <String>['XS', 'S', 'M', 'L', 'XL', 'XXL']
                                .map((e) => Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: const BorderSide(
                                              color: Colors.grey, width: 2)),
                                      child: SizedBox.square(
                                        dimension: 50,
                                        child: Center(
                                          child: Text(e,
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline6),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BackgroundBox(
                child: Column(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'Item Details\n\n',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline5!
                                .copyWith(fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                            text: product.details,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.w300),
                          )
                        ]))
                  ],
                ),
              ),
              BackgroundBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Reviews',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline5!
                                .copyWith(fontWeight: FontWeight.bold)),
                        const Spacer(),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Text('View All'),
                          label: const Icon(Icons.chevron_right_rounded),
                        )
                      ],
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        product.reviewsData!['name'] as String,
                        style: Theme.of(context).primaryTextTheme.headline6,
                      ),
                      subtitle: Row(
                        children: List.generate(
                            product.reviewsData!['rating'] as int,
                            (index) => const Icon(Icons.star,
                                color: Colors.amber, size: 18)),
                      ),
                      trailing: Text(product.reviewsData!['date'] as String),
                    ),
                    RichText(
                        text: TextSpan(
                            text: product.reviewsData!['about'],
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.w300),
                            children: const [
                          TextSpan(
                              text: '\n\n535 people found this review useful',
                              style: TextStyle(color: Colors.grey))
                        ])),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                              padding: EdgeInsets.all(0),
                              minWidth: 0,
                              textColor: Colors.grey,
                              onPressed: () {},
                              child: const Text(
                                'Comment',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 3),
                              )),
                          FlatButton.icon(
                              padding: EdgeInsets.all(0),
                              minWidth: 0,
                              textColor: Colors.grey,
                              onPressed: () {},
                              icon: Text('Helpful'),
                              label: Icon(Icons.thumb_up_alt_outlined))
                        ]),
                  ],
                ),
              ),
              BackgroundBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Related Products',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(
                        height: 250,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: ProductsData.productList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_ctx, index) => AspectRatio(
                                aspectRatio: 5 / 8,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ProductCardWidget(
                                      ProductsData.productList[index]),
                                ))))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
