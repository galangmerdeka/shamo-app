import 'package:flutter/material.dart';
import 'package:shamo_app/model/user.dart';
import 'package:shamo_app/theme.dart';

Container LandingPageHeader(User user) {
  return Container(
    padding: EdgeInsets.only(
      left: 10,
    ),
    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              top: 20,
            ),
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, ${user.name ?? 'john doe'}',
                  style: primaryTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '${user.email ?? 'john@dummy.com'}',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          // decoration: BoxDecoration(
          //   // color: Colors.red,
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(20),
          //   ),
          // ),
          // color: Colors.red,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: CircleAvatar(
            radius: 30.0,
            child: Image(
              image: NetworkImage(
                  user.imageProfile ??
                      'https://ui-avatars.com/api/?name=Burhan&color=7F9CF5&background=EBF4FF',
                  scale: 0.5),
              fit: BoxFit.cover,
            ),
          ),
          // color: Colors.blue,
        ),
      ],
    ),
  );
}
