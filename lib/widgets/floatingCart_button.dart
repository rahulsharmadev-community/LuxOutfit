//ignore_for_file: file_names

import 'package:flutter/material.dart';

class FloatingCartButton extends StatelessWidget {
  const FloatingCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffF5AF19), Color(0xffF36E15)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(64), bottomLeft: Radius.circular(64))),
        height: kToolbarHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: RichText(
                  text: const TextSpan(
                      text: '₹247.97',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                      children: [TextSpan(text: '\n 3 items')]),
                ),
              )
            ],
          ),
        ));
  }
}
