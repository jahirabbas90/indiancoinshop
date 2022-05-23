import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:indian_coin_shop/home_page/cart_view.dart';
import 'package:indian_coin_shop/home_page/home_view.dart';
import 'package:indian_coin_shop/home_page/managers/navigation_manager.dart';
import 'package:indian_coin_shop/home_page/menu_view.dart';
import 'package:indian_coin_shop/home_page/profile_view.dart';
import 'package:indian_coin_shop/home_page/wish_view.dart';
import 'package:indian_coin_shop/search_page/search_page.dart';
import 'package:page_transition/page_transition.dart';

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

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 4){
        _scaffoldKey.currentState!.openDrawer();
      }else{
        get<NavigationManager>().setNavigationIndexCmd;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    var _currentNavigationIndex =
    watchX((NavigationManager x) => x.setNavigationIndexCmd);
    Icon actionIcon = new Icon(Icons.search);


    final snackBar = SnackBar(
      content: const Text('To be Implemented!'),
      action: SnackBarAction(
        label: 'CLOSE',
        onPressed: () {},
      ),
    );
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          shadowColor: StyleConstants.colorWhite,
          backgroundColor: StyleConstants.colorWhite,
          centerTitle: false,
          elevation: 0.8,
          title: Image.asset('assets/images/logo.png', fit: BoxFit.contain , height: 35,),
          actions: <Widget>[
            new IconButton(icon: actionIcon,
              onPressed:(){
              Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: SearchPage()));
            } ,),]
      ),
      drawer: Drawer(),
      body: _homePageViews.elementAt(_currentNavigationIndex),
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
              child: Icon(Icons.shopping_bag),
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
              child: Icon(Icons.account_box),
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(2.0),
              child: Icon(Icons.menu),
            ),
            label: 'Menu',
          ),
        ],
        currentIndex: _currentIndex,
        onTap:_onTabTapped,
        //onTap: get<NavigationManager>().setNavigationIndexCmd,
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

}

Widget _drawer(BuildContext context) {
  return new Center(
    child: new RaisedButton(
      child: new Text('Close drawer'),
      onPressed: () => Navigator.of(context).pop(),
    ),
  );
}
