// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
// import 'package:shamo_app/presentation/landing_page/home.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/widget/navigation.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    bool is_chat_available = false;
    return Scaffold(
      backgroundColor: bgColor1,
      appBar: AppBar(
        backgroundColor: bgColor1,
        title: Center(
          child: Text(
            "Message Support",
            style: secondaryTextStyle.copyWith(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: (is_chat_available == true) ? ChatAvailable() : ChatNonAvailable(),
    );
  }
}

class ChatNonAvailable extends StatelessWidget {
  const ChatNonAvailable({
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
                'assets/images/icon_chat_empty.png',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Oppss no message yet?',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'You have never done a transaction',
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

class ChatAvailable extends StatelessWidget {
  const ChatAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, int index) {
          return Column(
            children: [
              ListTile(
                onTap: () {},
                trailing: Text(
                  "Now",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                leading: Container(
                  child: CircleAvatar(),
                ),
                title: Text(
                  "Shoe Store",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                subtitle: ReadMoreText(
                  "This item is sold out",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '',
                  trimExpandedText: '',
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
