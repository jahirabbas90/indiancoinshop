import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';

class TagsElement extends StatelessWidget {
  final String title;
  const TagsElement(this.title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: StyleConstants.swatchLightBlack,
      ),
      child: Center(
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Text(
                title,
                // ignore: prefer_const_constructors
                style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
    /*return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Text(
            title,
            // ignore: prefer_const_constructors
            style: GoogleFonts.oswald(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );*/
  }
}
