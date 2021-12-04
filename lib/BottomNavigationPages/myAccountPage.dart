//ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import '../widgets/floatingCart_button.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  textDecoration(String title) => Text(title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15, color: Colors.white));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              otherAccountsPicturesSize: const Size(80, 150),
              otherAccountsPictures: [
                textDecoration('Completed\n18'),
                textDecoration('Pending\n3'),
                textDecoration('Rejected\n5')
              ],
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffF5AF19), Color(0xffF36E15)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
              ),
              accountEmail: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('sandra.dom@example.com'),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: GestureDetector(
                        onTap: null,
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white70,
                        )),
                  ),
                ],
              ),
              accountName: RichText(
                  text: const TextSpan(
                      text: 'Sandra ',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                      text: 'Dom',
                      style: TextStyle(color: Colors.white),
                    )
                  ]))),
          const Card(
            child: ListTile(
              title: Text('My Orders'),
              subtitle:
                  Text('Your Orders Track, return, or buy things again.'),
              trailing: Icon(Icons.chevron_right_rounded),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text('My Addresses'),
              subtitle:
                  Text('D-154/52,MJ apartment New Delhi,Delhi-110042'),
              trailing: Icon(Icons.chevron_right_rounded),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text('Wallet Balance'),
              subtitle:
                  Text('current stored virtual money in your wallet.'),
              trailing: Text('Rs.100'),
            ),
          ),
          const ListTile(
            dense: true,
            tileColor: Colors.white,
            leading: Icon(Icons.history),
            title: Text('View transaction history'),
          ),
          const ListTile(
            dense: true,
            tileColor: Colors.white,
            leading: Icon(Icons.exit_to_app_outlined),
            title: Text('Logout from current devices'),
          ),
          const ListTile(
            dense: true,
            tileColor: Colors.white,
            leading: Icon(Icons.exit_to_app_outlined),
            title: Text('Logout of all devices'),
          )
        ],
      ),
    );
  }
}
