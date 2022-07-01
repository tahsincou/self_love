import 'package:flutter/material.dart';
import 'package:self_love/blocs/components/constants.dart';
import 'package:self_love/blocs/screens/dashboard/categories.dart';
import 'package:self_love/blocs/screens/profile/my_profile.dart';


class NavigationBarCommon extends StatefulWidget {
  const NavigationBarCommon({Key? key}) : super(key: key);

  @override
  State<NavigationBarCommon> createState() => _NavigationBarCommonState();
}

class _NavigationBarCommonState extends State<NavigationBarCommon> {
  int index =0;
  final screens= [
    DashboardCategoriesScreen(),
    MyProfileScreen(),
    MyProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 60,
          backgroundColor: Colors.green.shade200,
          indicatorColor: Colors.white,
          labelTextStyle: MaterialStateProperty.all(const TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold,
            color: kTextColor
          ))
        ),

        child: NavigationBar(
          selectedIndex: index,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: Duration(seconds: 2),
          onDestinationSelected: (index)=>
          setState(() => this.index = index),
          destinations: [
            NavigationDestination(icon: Icon(Icons.home_outlined, color: kBackgroundColor),
                selectedIcon:  Icon(Icons.home),label: 'Home'),
            NavigationDestination(icon: Icon(Icons.search_outlined, color: kBackgroundColor),
                selectedIcon:  Icon(Icons.search),
                label: 'Discover'),
            NavigationDestination(icon: Icon(Icons.account_box_outlined, color: kBackgroundColor),
                selectedIcon:  Icon(Icons.account_box),label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

