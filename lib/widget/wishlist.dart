import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/widget/navigation.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor1,
        title: Center(
          child: Text(
            "Favorite Shoes",
            style: secondaryTextStyle.copyWith(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: bgColor1,
      body: FavoriteNonAvailable(),
    );
  }
}

class FavoriteNonAvailable extends StatelessWidget {
  const FavoriteNonAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              child: Image.asset(
                'assets/images/icon_wishlist_filled.png',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'You don\'t have a dream shoes?',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find favorite shoes',
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
                color: secondaryTextColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 44,
              width: 152,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      // side: BorderSide
                    ),
                  ),
                ),
                onPressed: () {
                  print('clicked');
                  Get.to(Navigation());
                },
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
