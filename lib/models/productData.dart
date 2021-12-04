//ignore_for_file: file_names
import 'product.dart';

class ProductCategory {
  final String title, image;

  ProductCategory({required this.title, required this.image});
}

class ProductsData {
  static List<Product> get favoriteList {
    List<Product> list = [];
    for (var element in productList) {
      if (element.isFavorite) {
        list.add(element);
      }
    }
    return list;
  }

  static List<ProductCategory> categoryList = [
    ProductCategory(
        title: 'All Womens',
        image:
            'https://i.pinimg.com/originals/39/6f/75/396f75e3a165b03419229b0456fee4fb.jpg'),
    ProductCategory(
        title: 'New Collection',
        image:
            'https://i.pinimg.com/originals/06/b5/c5/06b5c5d052c51983152c9fddfdda3fea.jpg'),
    ProductCategory(
        title: 'Active / Sports',
        image:
            'https://i.pinimg.com/originals/f6/97/d7/f697d76bcfe469a7e0c78fe677fc9b65.jpg'),
    ProductCategory(
        title: 'Luxury',
        image:
            'https://i.pinimg.com/originals/1c/b6/df/1cb6df9b9a8d99287aa50490c6bf143a.jpg'),
    ProductCategory(
        title: 'Swimwear',
        image:
            'https://i.pinimg.com/originals/de/73/d6/de73d69b8550c9939aabc738779cf7f3.jpg'),
    ProductCategory(
        title: 'Casual',
        image:
            'https://i.pinimg.com/originals/34/f8/4d/34f84ddf053d0368d7b629b9ade59b1d.jpg'),
    ProductCategory(
        title: 'Party',
        image:
            'https://i.pinimg.com/originals/6f/f0/0a/6ff00a61a5e3fb24847a32a74cde0ad7.jpg'),
    ProductCategory(
        title: 'Home',
        image:
            'https://i.pinimg.com/originals/1e/fe/2c/1efe2cd6b4686491fe75e6b94c9e5fab.jpg'),
    ProductCategory(
        title: 'Baby',
        image:
            'https://i.pinimg.com/originals/21/16/59/21165916c16e325ec5ca68801fbc6d0c.jpg')
  ];
  static List<Product> productList = [
    Product(
        title: 'DKNY t-shirt - colour block front logo',
        amount: 50,
        image:
            'https://i.pinimg.com/originals/2d/2a/33/2d2a33cb914b865cbf327dcce40c5b8e.jpg'),
    Product(
        title: 'Polo Ralph Lauren jacket - light blue',
        amount: 200,
        image:
            'https://i.pinimg.com/originals/79/a7/56/79a75656ea83d58eb651d2c7848b080c.jpg'),
    Product(
        title: 'Midi dress with buttons short sleeve - pink',
        amount: 800,
        image:
            'https://i.pinimg.com/originals/67/3e/3e/673e3ed10a918744732bcb8506126e34.jpg'),
    Product(
        title: 'Blazer dress with buttons long sleeve...',
        amount: 800,
        image:
            'https://i.pinimg.com/originals/07/9b/f8/079bf8d6de0d3d573d038e2ee1f5e7d1.jpg'),
    Product(
        title: 'Moschnio checkerboard heart dress - blue',
        amount: 500,
        image:
            'https://i.pinimg.com/originals/2d/ff/8a/2dff8af9e4008b4f4682ea3c67aeaea4.jpg'),
    Product(
        title: 'Tommy Hilfiger padded jackets - black with...',
        amount: 560,
        image:
            'https://i.pinimg.com/originals/69/56/f5/6956f5c6fe7bc1f103c5dd739f7ae0e4.jpg'),
    Product(
        title: 'Calvin Klein - lounge hoody with drawstring..',
        amount: 780,
        image:
            'https://i.pinimg.com/originals/72/2f/6d/722f6d5d90d9f21e02cb1e35efd4b795.jpg'),
    Product(
        title: 'YSL cotton jumper - kashmir - beige ',
        amount: 360,
        image:
            'https://i.pinimg.com/originals/7d/10/f0/7d10f09808dd80b17b9b53faf4dbd6d1.jpg')
  ];
}
