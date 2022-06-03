

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:indian_coin_shop/home_page/home_screen_main.dart';
import 'package:indian_coin_shop/home_page/managers/homefeed_manager.dart';
import 'package:indian_coin_shop/login_page/login_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

String notificationTitle = 'No Title';
String notificationBody = 'No Body';
String notificationData = 'No Data';

class SplashScreen extends StatefulWidget with GetItStatefulWidgetMixin{

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with GetItStateMixin{
  List _posts = [];


  @override
  void initState() {
    /*final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();

    firebaseMessaging.streamCtlr.stream.listen(_changeData);
    firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    firebaseMessaging.titleCtlr.stream.listen(_changeTitle);*/

    super.initState();
    getData();
    get<HomeFeedManager>().homefeedData.execute();

  }
  _changeData(String msg) => setState(() => notificationData = msg);
  _changeBody(String msg) => setState(() => notificationBody = msg);
  _changeTitle(String msg) => setState(() => notificationTitle = msg);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "assets/images/login_back.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        ),
      ),

    );
  }

  getData() async {
    late List<int> myList=[];
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? '';
    print("posts : ${accessToken}");

    Timer(
      Duration(seconds: 5),
          (){
        //Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: CustomLandingPage()));
        if(accessToken.isNotEmpty){
          Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: HomePage()));
        }else{
          Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: LoginPage()));
        }
      },
    );

  }

}