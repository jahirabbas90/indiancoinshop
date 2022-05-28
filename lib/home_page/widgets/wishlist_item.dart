import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:indian_coin_shop/full_screen/full_screen_view.dart';

class WishListItem extends StatelessWidget {
  final String imageUrl,title,show_price,actual_price,shareLink,id;
  const WishListItem(this.imageUrl,this.title,this.show_price,this.actual_price,this.shareLink,this.id,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 290,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    Hero(
                      tag: "product_image"+id,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FullScreenView(imageUrl,id,title,show_price,actual_price)),
                          );

                          /*Navigator.push(context, MaterialPageRoute(builder: (_) {
                              return FullScreenView(imageUrl);  }));*/

                        },
                        child: Container(
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          margin: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: StyleConstants.green,
                          ),
                          child: Container(
                            //decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                            child: Center(
                              child: Text(
                                '30'+'%',
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.josefinSans(
                                    fontSize: 10,
                                    height: 1,
                                    color: StyleConstants.colorWhite,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(5),
                          child: Container(
                            //decoration: BoxDecoration(shape: BoxShape.circle, color: StyleConstants.colorWhite),
                            child: Center(
                              child: IconButton(
                                icon: Icon(Icons.shopping_cart,color: StyleConstants.green,),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
                /*Expanded(
                    child: Container(
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),*/
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    title,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                        fontSize: 13,
                        height: 1,
                        color: StyleConstants.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        '\u{20B9}'+show_price,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.josefinSans(
                            fontSize: 16,
                            height: 1,
                            color: StyleConstants.green,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child:Text(
                        '\u{20B9}'+actual_price,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.josefinSans(
                            fontSize: 16,
                            height: 1,
                            color: StyleConstants.colorred,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w600),
                      ),
                    ),


                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );

  }
}
