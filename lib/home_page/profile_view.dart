import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:page_transition/page_transition.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
          },
          child: Container(
            height: 50,
            color: StyleConstants.colorWhite,
            margin: EdgeInsets.only(bottom: 1.0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(left :31.0),
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
                      margin: EdgeInsets.only(right: 8.0),
                      child:ImageIcon(
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
            margin: EdgeInsets.only(bottom: 1.0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(left: 31.0),
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
                      margin: EdgeInsets.only(right: 8.0),
                      child:ImageIcon(
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
            margin: EdgeInsets.only(bottom: 1.0),
            color: StyleConstants.colorWhite,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(left: 31.0),
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
                      margin: EdgeInsets.only(right: 8.0),
                      child:ImageIcon(
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
            margin: EdgeInsets.only(bottom: 1.0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(left: 31.0),
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
                      margin: EdgeInsets.only(right: 8.0),
                      child:ImageIcon(
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
            margin: EdgeInsets.only(bottom: 1.0),
            color: StyleConstants.colorWhite,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(left: 31.0),
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
                      margin: EdgeInsets.only(right: 8.0),
                      child:ImageIcon(
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
            margin: EdgeInsets.only(bottom: 1.0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(left: 31.0),
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
                      margin: EdgeInsets.only(right: 8.0),
                      child:ImageIcon(
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
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 31.0),
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
                    margin: EdgeInsets.only(right: 8.0),
                    child:ImageIcon(
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
}
