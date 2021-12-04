//ignore_for_file: file_names
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Drawer build(BuildContext context) {
    List<Map<String, dynamic>> _list = [
      {'title': 'Lux Home', 'icon': Icons.home},
      {'title': 'Lux Coin Zone', 'icon': Icons.toll_outlined},
      {'title': 'Redeem Cards', 'icon': Icons.redeem_outlined},
      {'title': 'Lux Wallet', 'icon': Icons.account_balance_wallet_outlined},
      {'title': 'Offer Zone', 'icon': Icons.local_offer_outlined},
      {'title': 'Choose Language', 'icon': Icons.translate_outlined},
      {'title': 'Help Zone', 'icon': Icons.support_agent_outlined},
      {'title': 'Offer Zone', 'icon': Icons.local_offer_outlined},
    ];
    return Drawer(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      UserAccountsDrawerHeader(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffF5AF19), Color(0xffF36E15)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
          currentAccountPicture: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
          ),
          accountEmail: const Text('sandra.dom@example.com'),
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
      SingleChildScrollView(
        child: Column(
            children: List.generate(
                _list.length,
                (index) => ListTile(
                    dense: true,
                    onTap: () => Navigator.of(context).pop(),
                    leading: Icon(_list[index]['icon']),
                    title: Text(_list[index]['title'])))),
      )
    ]));
  }
}
