import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';

class AllCointItem extends StatelessWidget {
  final String imageUrl,title,show_price,actual_price,shareLink,id;
  const AllCointItem(this.imageUrl,this.title,this.show_price,this.actual_price,this.shareLink,this.id,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 229.0,
          //height: 186.0,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,

          child:ClipRRect(
            child: Image.network(
              imageUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Text(
          title,
          maxLines: 3,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
              fontSize: 13,
              height: 1,
              color: StyleConstants.black,
              fontWeight: FontWeight.w400),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\u{20B9}'+show_price,
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  height: 1,
                  color: StyleConstants.green,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              '\u{20B9}'+actual_price,
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  height: 1,
                  color: StyleConstants.colorred,
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
