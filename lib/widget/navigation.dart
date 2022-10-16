import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/landing_page/chat.dart';
import 'package:shamo_app/presentation/landing_page/home.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/widget/wishlist.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final List<Map<String, dynamic>> _bottomNavbar = [
    {
      'page': Home(),
      'icon': 'assets/images/icon_home.png',
      'title': 'Home Screen',
      'isActive': false,
    },
    {
      'page': Chat(),
      'icon': 'assets/images/icon_chat.png',
      'title': 'Chat Screen',
      'isActive': false,
    },
    {
      'page': Wishlist(),
      'icon': 'assets/images/icon_wishlist.png',
      'title': 'Wishlist',
      'isActive': false,
    },
  ];

  int _selectedPageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _bottomNavbar;
      _selectedPageIndex = index;
      print("at pages : ${_bottomNavbar[_selectedPageIndex]['title']}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {},
        child: ImageIcon(
          AssetImage("assets/images/icon_cart_home.png"),
        ),
      ),
      backgroundColor: bgColor1,
      body: _bottomNavbar[_selectedPageIndex]['page'],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: bgColor2,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _selectedPage(0);
                });
              },
              icon: ImageIcon(
                AssetImage(_bottomNavbar[0]['icon']),
                size: 45,
                color: (_selectedPageIndex == 0)
                    ? primaryColor
                    : secondaryTextColor,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _selectedPage(1);
                });
              },
              icon: ImageIcon(
                AssetImage(_bottomNavbar[1]['icon']),
                size: 45,
                color: (_selectedPageIndex == 1)
                    ? primaryColor
                    : secondaryTextColor,
              ),
            ),
            // IconButton(
            //   onPressed: null,
            //   icon: ImageIcon(
            //     AssetImage('assets/images/icon_home.png'),
            //     size: 45,
            //     color: primaryColor,
            //   ),
            // ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _selectedPage(2);
                });
              },
              icon: ImageIcon(
                AssetImage(_bottomNavbar[2]['icon']),
                size: 45,
                color: (_selectedPageIndex == 2)
                    ? primaryColor
                    : secondaryTextColor,
              ),
            ),
            IconButton(
              onPressed: null,
              icon: ImageIcon(
                AssetImage('assets/images/icon_profile.png'),
                size: 45,
                color: secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
