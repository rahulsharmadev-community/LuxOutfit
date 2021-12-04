import 'package:flutter/material.dart';
import 'widgets/Drawer_widget.dart';
import 'BottomNavigationPages/myAccountPage.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/floatingCart_button.dart';
import 'BottomNavigationPages/categoryPage.dart';
import 'BottomNavigationPages/favouritePage.dart';
import 'BottomNavigationPages/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DemoOutlet',
      theme: ThemeData(
          primaryTextTheme: const TextTheme(
              headline5: TextStyle(fontSize: 20, color: Colors.black),
              headline6: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  wordSpacing: 2,
                  letterSpacing: 0.8))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _globleKey = GlobalKey<ScaffoldState>();
  var navigationTab = const [
    {
      'icon': Icons.home_outlined,
      'name': 'LuxOutfit',
      'page': HomePage(),
    },
    {
      'icon': Icons.grid_view_outlined,
      'name': 'Categories',
      'page': CategoriesPage(),
    },
    {
      'icon': Icons.favorite_border_outlined,
      'name': 'Liked',
      'page': FavouritePage(),
    },
    {
      'icon': Icons.person_outline_outlined,
      'name': 'Account',
      'page': MyAccountPage(),
    }
  ];
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globleKey,
        drawer: const DrawerWidget(),
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).padding.top + kToolbarHeight),
            child: CustomAppBar(
                title: navigationTab[currentTab]['name'] as String,
                isSerchBar: currentTab == 3 ? false : true,
                actionButton: () => _globleKey.currentState!.showSnackBar(
                    const SnackBar(content: Text('Alert button is Pressed'))),
                leadingButton: () => _globleKey.currentState!.openDrawer())),
        bottomNavigationBar: BottomNavigationBar(
            selectedIconTheme: const IconThemeData(size: 28),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            currentIndex: currentTab,
            onTap: (value) => setState(() => currentTab = value),
            items: List.generate(
                navigationTab.length,
                (index) => BottomNavigationBarItem(
                    label: navigationTab[index]['name'] as String,
                    icon: Icon(navigationTab[index]['icon'] as IconData)))),
        body: IndexedStack(
            index: currentTab,
            children: List.generate(navigationTab.length,
                (index) => navigationTab[currentTab]['page'] as Widget)));
  }
}
