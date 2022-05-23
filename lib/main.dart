
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:indian_coin_shop/locator.dart';
import 'package:indian_coin_shop/splash_screen/spalsh_page.dart';


void main() async {
  registerViewModels();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IndianCoinShop',
      theme: ThemeData(
        primarySwatch: StyleConstants.colorWhite,
      ),
      home: SplashScreen(),
    );
  }
}
