
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:indian_coin_shop/chnage_password/change_password_page.dart';
import 'package:indian_coin_shop/home_page/wish_view.dart';
import 'package:indian_coin_shop/login_page/login_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex:2,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: StyleConstants.colorWhite,
                    border: Border.all(color: Colors.grey)
                  ),
                  child: const Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: const Icon(Icons.camera_alt,
                      color: StyleConstants.colorNeutralgrey,
                      size: 24,
                    ),
                  ),
                ),
            ),

            Expanded(flex:5,
              child: Container(
                height: 100,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: StyleConstants.colorWhite,
                    border: Border.all(color: Colors.blueAccent,width: 3)
                ),
                child: Center(
                  child: Image.asset('assets/images/logo.png',
                      color: StyleConstants.swatchRed,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
            ),

            Expanded(flex:2,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: StyleConstants.colorWhite,
                    border: Border.all(color: Colors.red)
                ),
                child: const Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: const Icon(Icons.logout,color: StyleConstants.colorred,),
                ),
              ),
            ),
          ],
        ),*/

        GestureDetector(
          onTap: (){
          },
          child: Container(
            height: 50,
            color: StyleConstants.colorWhite,
            margin: const EdgeInsets.only(bottom: 1.0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.only(left :31.0),
                    child:Text(
                      "My ACCOUNT",
                      // ignore: prefer_const_constructors
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: StyleConstants.swatchBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child:const ImageIcon(
                        AssetImage('assets/images/next_.png'),
                        color: StyleConstants.swatchBlack,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: (){
          },
          child: Container(
            height: 50,
            color: StyleConstants.colorWhite,
            margin: const EdgeInsets.only(bottom: 1.0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.only(left: 31.0),
                    child:Text(
                      "BILLING ADDRESS",
                      // ignore: prefer_const_constructors
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: StyleConstants.swatchBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child:const ImageIcon(
                        AssetImage('assets/images/next_.png'),
                        color: StyleConstants.swatchBlack,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: (){
          },
          child: Container(
            height: 50,
            margin: const EdgeInsets.only(bottom: 1.0),
            color: StyleConstants.colorWhite,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.only(left: 31.0),
                    child:Text(
                      "Address Book".toUpperCase(),
                      // ignore: prefer_const_constructors
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: StyleConstants.swatchBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child:const ImageIcon(
                        const AssetImage('assets/images/next_.png'),
                        color: StyleConstants.swatchBlack,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: (){
          },
          child: Container(
            height: 50,
            color: StyleConstants.colorWhite,
            margin: const EdgeInsets.only(bottom: 1.0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.only(left: 31.0),
                    child:Text(
                      "My Orders".toUpperCase(),
                      // ignore: prefer_const_constructors
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: StyleConstants.swatchBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child:const ImageIcon(
                        AssetImage('assets/images/next_.png'),
                        color: StyleConstants.swatchBlack,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: (){
            Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: const WishView()));
          },
          child: Container(
            height: 50,
            margin: const EdgeInsets.only(bottom: 1.0),
            color: StyleConstants.colorWhite,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.only(left: 31.0),
                    child:Text(
                      "My favourites".toUpperCase(),
                      // ignore: prefer_const_constructors
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: StyleConstants.swatchBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child:const ImageIcon(
                        const AssetImage('assets/images/next_.png'),
                        color: StyleConstants.swatchBlack,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: (){
            Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: const ChangePassword()));
          },
          child: Container(
            height: 50,
            color: StyleConstants.colorWhite,
            margin: const EdgeInsets.only(bottom: 1.0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.only(left: 31.0),
                    child:Text(
                      "Change Password".toUpperCase(),
                      // ignore: prefer_const_constructors
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: StyleConstants.swatchBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child:const ImageIcon(
                        AssetImage('assets/images/next_.png'),
                        color: StyleConstants.swatchBlack,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        Container(
          height: 50,
          color: StyleConstants.colorWhite,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: GestureDetector(
                  onTap: () async {
                    //logout(context);
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
                                logout(context);
                              },
                              child: Text('Yes',style: GoogleFonts.inter(fontSize: 14, color: StyleConstants.swatchRed,fontWeight: FontWeight.w700)),
                            ),
                          ],
                        );
                      },
                    );//BlurryDialog("Lo
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 31.0),
                    child:Text(
                      "Logout".toUpperCase(),
                      // ignore: prefer_const_constructors
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: StyleConstants.swatchBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    child:const ImageIcon(
                      AssetImage('assets/images/next_.png'),
                      color: StyleConstants.swatchBlack,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  logout(BuildContext context) async {
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
        MaterialPageRoute(builder: (context) => const LoginPage()),
            (r) => false
    );
  }
}
