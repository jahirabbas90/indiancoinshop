import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex:2 ,
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    elevation: 5,
                    child: Image.network(
                      "https://www.indiancoinshop.com/product-pics/small/363_hke8uYLyNQEyvKDidkxW.jpg",
                      fit: BoxFit.cover,
                    ),
                  )
              ),
              Expanded(
                  flex:6 ,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,bottom:5),
                          child: Text(
                            'Awadh Muhammad Banaras Mint ',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.josefinSans(
                                fontSize: 16,
                                height: 1,
                                color: StyleConstants.swatchRed,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10),
                          child: Text(
                            'Silver Rupee',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.josefinSans(
                                fontSize: 14,
                                height: 1,
                                color: StyleConstants.swatchRed,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10),
                              child: Text(
                                '1 X ₹1575',
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.josefinSans(
                                    fontSize: 12,
                                    height: 1,
                                    color: StyleConstants.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10),
                              child:Text(
                                '\u{20B9} 4000',
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.josefinSans(
                                    fontSize: 12,
                                    height: 1,
                                    color: StyleConstants.colorred,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10),
                          child: Container(
                            width:55,
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: StyleConstants.swatchRed),
                            child: Center(
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 12,
                                      )),
                                  Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 3),
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: StyleConstants.colorWhite),
                                    child: const Text(
                                      '3',
                                      style: TextStyle(color: Colors.black, fontSize: 10),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 12,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  )
              ),
              Expanded(
                  flex:1 ,
                  child: Container(
                    child: const Icon(Icons.delete_forever,color: StyleConstants.colorred,),
                  )
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
