import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:indian_coin_shop/home_page/cart_view.dart';
import 'package:indian_coin_shop/home_page/home_view.dart';
import 'package:indian_coin_shop/home_page/managers/navigation_manager.dart';
import 'package:indian_coin_shop/home_page/menu_view.dart';
import 'package:indian_coin_shop/home_page/profile_view.dart';
import 'package:indian_coin_shop/home_page/wish_view.dart';
import 'package:indian_coin_shop/login_page/login_view.dart';
import 'package:indian_coin_shop/search_page/search_page.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget with GetItStatefulWidgetMixin {

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with GetItStateMixin{

  String user_name="";
  int _currentIndex = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  final List<dynamic> _homePageViews = [
    HomeView(),
    WishView(),
    CartView(),
    ProfileView(),
    MenuView(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    var _currentNavigationIndex =
    watchX((NavigationManager x) => x.setNavigationIndexCmd);
    Icon actionIcon = Icon(Icons.search);
    get<NavigationManager>().setNavigationIndexCmd;


    void _onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
        _currentNavigationIndex=_currentIndex;
        if (_currentIndex == 4){
          _scaffoldKey.currentState!.openDrawer();
        }else{
          _currentNavigationIndex=_currentIndex;
          get<NavigationManager>().setNavigationIndexCmd;
        }
      });
    }

    final snackBar = SnackBar(
      content: const Text('To be Implemented!'),
      action: SnackBarAction(
        label: 'CLOSE',
        onPressed: () {},
      ),
    );


    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: MultiLevelDrawer(
          backgroundColor: StyleConstants.swatchRed,
          rippleColor: Colors.white,
          subMenuBackgroundColor: StyleConstants.swatchRed,
          header: Container(                  // Header for Drawer
            //height: size.height * 0.25,
            height: 10,
          ),

          children: [
            MLMenuItem(
              leading: Icon(Icons.home,color: StyleConstants.colorWhite,),
              content: Text(
                "Home",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.josefinSans(
                  fontSize: 14.0,
                  color: StyleConstants.colorWhite,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onClick: () {},
            ),// Child Elements for Each Drawer Item
            MLMenuItem(
                leading: Icon(Icons.attach_money,color: StyleConstants.colorWhite,),
                trailing: Icon(Icons.arrow_right,color: Colors.white,),
                content: Text(
                  "Coins",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.josefinSans(
                    fontSize: 14.0,
                    color: StyleConstants.colorWhite,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subMenuItems: [
                  MLSubmenu(onClick: () {}, submenuContent: Text(
                    "Option 1",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                      fontSize: 12.0,
                      color: StyleConstants.colorWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),),
                  MLSubmenu(onClick: () {}, submenuContent: Text(
                    "Option 2",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                      fontSize: 12.0,
                      color: StyleConstants.colorWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),),
                  MLSubmenu(onClick: () {}, submenuContent: Text(
                    "Option 3",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                      fontSize: 12.0,
                      color: StyleConstants.colorWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),),
                ],
                onClick: () {}),
            MLMenuItem(
              leading: Icon(Icons.money,color: StyleConstants.colorWhite,),
              content: Text(
                "Paper Money",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.josefinSans(
                  fontSize: 14.0,
                  color: StyleConstants.colorWhite,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onClick: () {},
            ),
            MLMenuItem(
                leading: Icon(Icons.currency_rupee,color: StyleConstants.colorWhite,),
                trailing: Icon(Icons.arrow_right,color: Colors.white,),
                content: Text(
                  "World Currency",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.josefinSans(
                    fontSize: 14.0,
                    color: StyleConstants.colorWhite,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onClick: () {},
                subMenuItems: [
                  MLSubmenu(onClick: () {}, submenuContent: Text(
                    "Option 1",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                      fontSize: 12.0,
                      color: StyleConstants.colorWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),),
                  MLSubmenu(onClick: () {}, submenuContent: Text(
                    "Option 2",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                      fontSize: 12.0,
                      color: StyleConstants.colorWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),)
                ]),
            MLMenuItem(
              leading: Icon(Icons.token_sharp,color: StyleConstants.colorWhite,),
              content: Text(
                "Tokens & Badges",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.josefinSans(
                  fontSize: 14.0,
                  color: StyleConstants.colorWhite,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onClick: () {},
            ),
            MLMenuItem(
              leading: Icon(Icons.book,color: StyleConstants.colorWhite,),
              content: Text(
                "Books",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.josefinSans(
                  fontSize: 14.0,
                  color: StyleConstants.colorWhite,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onClick: () {},
            ),
            MLMenuItem(
              leading: Icon(Icons.devices_other_sharp,color: StyleConstants.colorWhite,),
              content: Text(
                "Other Collection",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.josefinSans(
                  fontSize: 14.0,
                  color: StyleConstants.colorWhite,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onClick: () {},
            ),
            MLMenuItem(
              leading: Icon(Icons.card_giftcard_rounded,color: StyleConstants.colorWhite,),
              content: Text(
                "Philately",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.josefinSans(
                  fontSize: 14.0,
                  color: StyleConstants.colorWhite,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onClick: () {},
            ),
            MLMenuItem(
              leading: Icon(Icons.logout,color: StyleConstants.colorWhite,),
              content: Text(
                "Logout",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.josefinSans(
                  fontSize: 14.0,
                  color: StyleConstants.colorWhite,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onClick: () async {
                bool result = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Logout',style: GoogleFonts.inter(fontSize: 20, color: StyleConstants.swatchRed,fontWeight: FontWeight.w700),
                      ),
                      content: Text('Do you want to logout?',style: GoogleFonts.inter(fontSize: 16, color: StyleConstants.black,fontWeight: FontWeight.w400)),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop(true);
                          },
                          child: Text('No',style: GoogleFonts.inter(fontSize: 16, color: StyleConstants.black,fontWeight: FontWeight.w700)),
                        ),
                        FlatButton(
                          onPressed: () {
                            logout();
                          },
                          child: Text('Yes',style: GoogleFonts.inter(fontSize: 14, color: StyleConstants.swatchRed,fontWeight: FontWeight.w700)),
                        ),
                      ],
                    );
                  },
                );//BlurryDia
              },
            ),
          ],
        ),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            shadowColor: StyleConstants.colorWhite,
            backgroundColor: StyleConstants.colorWhite,
            centerTitle: false,
            elevation: 0.8,
            title: Image.asset('assets/images/logo.png', fit: BoxFit.contain , height: 35,),
            actions: <Widget>[
              IconButton(icon: actionIcon,
                onPressed:(){
                Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: SearchPage()));
              } ,),]
        ),

        body: _homePageViews.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 9.0,
          unselectedFontSize: 9.0,
          selectedIconTheme: const IconThemeData(size: 24.0),
          selectedItemColor: StyleConstants.swatchRed,
          unselectedItemColor: StyleConstants.swatchLightBlack,
          selectedLabelStyle: GoogleFonts.inter(
            fontWeight: FontWeight.normal,
            color: StyleConstants.swatchRed,
          ),
          unselectedLabelStyle: GoogleFonts.inter(
            fontWeight: FontWeight.normal,
            color: StyleConstants.swatchLightBlack,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(2.0),
                child: Icon(Icons.home),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(2.0),
                child: Icon(Icons.favorite),
              ),
              label: 'WishList',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(2.0),
                child: Icon(Icons.shopping_cart),
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(2.0),
                child: Icon(Icons.account_circle),
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(2.0),
                child: Icon(Icons.menu_sharp),
              ),
              label: 'Menu',
            ),
          ],
          currentIndex: _currentIndex,
          onTap:_onTabTapped,
          //onTap: get<NavigationManager>().setNavigationIndexCmd,
        ),
      ),
    );
  }

  Future<bool> showExitPopup() async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App',style: GoogleFonts.inter(
            fontSize: 20,
            color: StyleConstants.swatchRed,
            fontWeight: FontWeight.w600),),
        content: Text('Do you want to exit ?',style: GoogleFonts.inter(
            fontSize: 16,
            color: StyleConstants.swatchLightBlack,
            fontWeight: FontWeight.w500),),
        actions:[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:Text('No',style: GoogleFonts.inter(
                fontSize: 16,
                color: StyleConstants.green,
                fontWeight: FontWeight.w600),),
          ),

          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            //return true when click on "Yes"
            child:Text('Yes',style: GoogleFonts.inter(
                fontSize: 12,
                color: StyleConstants.swatchBlack,
                fontWeight: FontWeight.w400),),
          ),

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }

  logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("user_id", "");
    pref.setString("user_name", "");
    pref.setString("user_email", "");
    pref.setString("user_mobile", "");
    pref.setString("access_token", "");
    Fluttertoast.showToast(
        msg: "You are now logged out!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: StyleConstants.colorWhite,
        fontSize: 16.0
    );
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
            (r) => false
    );
  }

}

Widget _drawer(BuildContext context) {
  return Center(
    child: RaisedButton(
      child: Text('Close drawer'),
      onPressed: () => Navigator.of(context).pop(),
    ),
  );
}







