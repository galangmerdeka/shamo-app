import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

class LandingPageCategories extends StatefulWidget {
  const LandingPageCategories({super.key});

  @override
  State<LandingPageCategories> createState() => _LandingPageCategoriesState();
}

class _LandingPageCategoriesState extends State<LandingPageCategories> {
  final List<String> _categories = [
    'All Shoes',
    'Running',
    'Basketball',
    'Tennis',
    'Other',
  ];

  int _selectCategories = 0;
  void pickCategories(int index) {
    setState(() {
      _categories;
      _selectCategories = index;
      print("Categories selected is ${_categories[_selectCategories]}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: Colors.red,
      padding: EdgeInsets.only(
        left: 10,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ButtonCategories(0),
            SizedBox(
              width: 10,
            ),
            ButtonCategories(1),
            SizedBox(
              width: 10,
            ),
            ButtonCategories(2),
            SizedBox(
              width: 10,
            ),
            ButtonCategories(3),
            SizedBox(
              width: 10,
            ),
            ButtonCategories(4),
          ],
        ),
      ),
    );
  }

  ElevatedButton ButtonCategories(int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          pickCategories(index);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        child: Text(
          _categories[index],
          style: primaryTextStyle.copyWith(
              fontSize: 16,
              color: (_selectCategories == index)
                  ? primaryTextColor
                  : secondaryTextColor),
        ),
      ),
      style: categoriesButtonStyle.copyWith(
        backgroundColor: MaterialStateProperty.all(
          (_selectCategories == index)
              ? primaryColor
              : Colors.transparent.withOpacity(1.0),
        ),
      ),
    );
  }
}
