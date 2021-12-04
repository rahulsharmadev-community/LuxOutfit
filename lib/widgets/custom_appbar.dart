//ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool isSerchBar;
  final VoidCallback actionButton;
  final VoidCallback leadingButton;

  const CustomAppBar(
      {Key? key,
      required this.title,
      this.isSerchBar = true,
      required this.actionButton,
      required this.leadingButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).padding.top +
            kToolbarHeight * (isSerchBar ? 2 : 1),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffF5AF19), Color(0xffF36E15)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: title != 'LuxOutfit'
              ? Text(title)
              : RichText(
                  text: const TextSpan(
                      text: 'Lux',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      children: [
                      TextSpan(
                        text: 'Outfit',
                        style: TextStyle(color: Colors.white),
                      )
                    ])),
          leading: IconButton(
              onPressed: leadingButton, icon: const Icon(Icons.menu)),
          actions: [
            IconButton(
                onPressed: actionButton,
                icon: const Icon(Icons.notifications_none)),
          ],
          bottom: isSerchBar
              ? PreferredSize(
                  preferredSize: Size.fromHeight(56),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)),
                      child: TextField(
                        maxLines: 1,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: 'What are you looking for?',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  ),
                )
              : null,
        ));
  }
}
