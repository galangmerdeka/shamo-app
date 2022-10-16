// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/provider/user_provider.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/widget/landing_page/categories.dart';
import 'package:shamo_app/widget/landing_page/header.dart';
import 'package:shamo_app/widget/landing_page/new_arrivals.dart';
import 'package:shamo_app/widget/landing_page/popular.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, _) => Scaffold(
        backgroundColor: bgColor1,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                LandingPageHeader(userProvider.getDataUser!),
                SizedBox(
                  height: 20,
                ),
                //buatkan logic untuk menampilkan halaman For You ketika categories dipilih
                LandingPageCategories(),
                SizedBox(
                  height: 20,
                ),
                LandingPagePopular(),
                SizedBox(
                  height: 20,
                ),
                NewArrival(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildChips() {
  //   List<Widget> chips = [];
  //   for (var i = 0; i < _categories.length; i++) {
  //     FilterChip filterChip = FilterChip(
  //       label: Text(
  //         _categories[i]['name'],
  //       ),
  //       onSelected: (bool selected) {
  //         setState(
  //           () {
  //             bool isTap = false;
  //             isTap = _categories[i]['isSelected'];
  //           },
  //         );
  //       },
  //     );
  //     chips.add(
  //       Padding(
  //         padding: EdgeInsets.symmetric(
  //           horizontal: 10,
  //         ),
  //         child: filterChip,
  //       ),
  //     );
  //   }
  //   return ListView(
  //     scrollDirection: Axis.horizontal,
  //     children: chips,
  //   );
  // }
}
