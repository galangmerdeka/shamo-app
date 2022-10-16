import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:shamo_app/presentation/landing_page/home.dart';
import 'package:shamo_app/presentation/product%20detail/product_page.dart';
import 'package:shamo_app/presentation/splash/splash_screen.dart';
import 'package:shamo_app/presentation/user.dart/edit_profile_page.dart';
import 'package:shamo_app/presentation/user.dart/login_page.dart';
import 'package:shamo_app/presentation/user.dart/signup_page.dart';
import 'package:shamo_app/provider/products_provider.dart';
import 'package:shamo_app/provider/user_provider.dart';
import 'package:shamo_app/theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  // Color colorWhiteLabel = Color.fromARGB(255, 255, 255, 255);
  // Color colorCaption = Color.fromARGB(156, 198, 198, 204);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ProductsProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primaryColorDark: bgColor1,
          ).copyWith(
            background: bgColor1,
          ),
          inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
        ),
        title: 'Shamo App',
        initialRoute: '/',
        routes: {
          // '/': (ctx) => ProductPage(),
          '/': (ctx) => SplashScreen(),
          SignUpPage.routeName: (ctx) => SignUpPage(),
          LoginPage.routeName: (ctx) => LoginPage(),
          EditProfilePage.routeName: (ctx) => EditProfilePage(),
          Home.routeName: (ctx) => Home(),
          ProductPage.routeName: (ctx) => ProductPage(),
        },
      ),
    );
  }
}
