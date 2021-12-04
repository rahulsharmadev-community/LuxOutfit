import 'package:intl/intl.dart';

class Product {
  final String title;
  final String image;
  final String details;
  late Map<String, dynamic>? reviewsData;
  bool isFavorite;
  final int amount;

  Product({
    required this.title,
    required this.amount,
    required this.image,
    this.details =
        'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar.'
            ' Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem.'
            '\n\nRegular fit. True to size. Model wears: UK S/ EU S/ US',
    this.reviewsData,
    this.isFavorite = false,
  }) {
    reviewsData ??= {
      'name': 'Leslie Alexander',
      'about': 'Really cool and stylish light weight jacket, has 3 inside '
          'pockets and feels strong. The fitting is good and not too loose, quite '
          'warm but definitely not for winter.',
      'date': DateFormat.yMMMd().format(DateTime.now()),
      'rating': 4
    };
  }

  void switchFavorite() {
    isFavorite = !isFavorite;
  }
}
