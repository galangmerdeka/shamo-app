import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/presentation/user.dart/login_page.dart';
import 'package:shamo_app/provider/products_provider.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/widget/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;
  final storage = new FlutterSecureStorage();
  // String? token_value;
  @override
  void initState() {
    // TODO: implement initState
    getInit();
    isLoading = true;
    super.initState();
  }

  getInit() async {
    await Provider.of<ProductsProvider>(context, listen: false).getProducts();
    isLoading = false;
    // token_value = await storage.read(key: 'key') ?? '0';
    // print('token : ${token_value}');
    Get.offAll(() => LoginPage());
    // if (token_value!.isEmpty || token_value! == '0') {
    //   Get.offAll(() => Navigation());
    // }
    // Get.offAll(() => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 130,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/Union.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            (isLoading == true)
                ? CircularProgressIndicator(
                    strokeWidth: 2.0,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
