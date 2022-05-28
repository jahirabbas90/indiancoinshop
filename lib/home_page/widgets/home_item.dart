import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/all_coins_page/allcoinsview.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:page_transition/page_transition.dart';

class HomeItem extends StatelessWidget {
  final String imageUrl,title;
  const HomeItem(this.imageUrl,this.title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.only(left: 10,top: 10,right: 10),
      child: Container(
        height: 165.0,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,

        child:Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    title.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 24.0,
                      color: StyleConstants.swatchGray,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child:ElevatedButton(

                        child: Text(
                            "Shop now".toUpperCase(),
                            style: TextStyle(fontSize: 14,color: StyleConstants.colorWhite)
                        ),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(StyleConstants.buttonColor),
                            backgroundColor: MaterialStateProperty.all<Color>(StyleConstants.buttonColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: BorderSide(color: StyleConstants.buttonColor)
                                )
                            )
                        ),
                        onPressed: () =>Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: AllCoinsPage(title))),

                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
