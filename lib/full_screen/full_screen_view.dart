import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'package:indian_coin_shop/all_coins_page/allcoinsview.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:indian_coin_shop/full_screen/widget/product_image_item.dart';
import 'package:indian_coin_shop/full_screen/widget/similar_product_item.dart';
import 'package:indian_coin_shop/full_screen/widget/tags_element.dart';
import 'package:indian_coin_shop/home_page/widgets/all_coin_item.dart';
import 'package:page_transition/page_transition.dart';

class FullScreenView extends StatefulWidget {
  final String imageUrl,tag,title,show_price,actual_price;
  FullScreenView(this.imageUrl,this.tag,this.title,this.actual_price,this.show_price,{Key? key}) : super(key: key);

  @override
  _FullScreenViewState createState() => _FullScreenViewState();
}

class _FullScreenViewState extends State<FullScreenView> {

  bool isFav=false;

  @override
  void initState() {
    setState(() {
      isFav=false;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Second Screen"),
        backgroundColor: StyleConstants.swatchRed,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
            color: Colors.white,),
          onPressed: ()=> Navigator.of(context).pop(),
          //=> Navigator.of(context).pop(),
        ),
      ),
      body: Hero(
        tag: "product_image"+widget.tag,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 400.0,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            widget.imageUrl,
                          ),
                          fit: BoxFit.cover)),
                ),
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) => Card(
                      child: Center(child:ProductImageItem(widget.imageUrl) ),
                      //ProductImageItem(widget.imageUrl)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.title,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                        fontSize: 18,
                        height: 1,
                        color: StyleConstants.swatchRed,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Text(
                    widget.title.toUpperCase(),
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                        fontSize: 15,
                        height: 1,
                        color: StyleConstants.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          '\u{20B9}'+widget.show_price,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.josefinSans(
                              fontSize: 28,
                              height: 1,
                              color: StyleConstants.green,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child:Text(
                          '\u{20B9}'+widget.actual_price,
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
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle,
                          color: StyleConstants.colorWhite,
                        border: Border.all(color: isFav?StyleConstants.green:StyleConstants.colorNeutralgrey),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.favorite_border_outlined,color: isFav?StyleConstants.green:StyleConstants.colorNeutralgrey,),
                          onPressed: () {
                            setState(() {
                              isFav=true;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 42,
                    child: ElevatedButton(
                      child: Text(
                          "Add To Cart",
                          style: GoogleFonts.josefinSans(
                              fontSize: 17,
                              height: 1,
                              color: StyleConstants.colorWhite,
                              fontWeight: FontWeight.w700),
                      ),
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(StyleConstants.yellow_button),
                          backgroundColor: MaterialStateProperty.all<Color>(StyleConstants.yellow_button),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  side: BorderSide(color: StyleConstants.yellow_button_border)
                              )
                          )
                      ),
                      onPressed: () =>Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: AllCoinsPage(widget.title))),

                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: Divider()),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Tags : ",
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.josefinSans(
                                fontSize: 16,
                                height: 1,
                                color: StyleConstants.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        height: 30,
                        margin: EdgeInsets.only(top: 10.0,bottom: 10),
                        padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.topLeft,
                        child:ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 5,
                            //itemCount: _tagList.length,
                            //itemCount: _fullViewNewsData.data.post.tags.length,
                            itemBuilder: (BuildContext context, int index) => GestureDetector(
                              //child: TagsElement((_tagList[index]['name']),
                              child: TagsElement(" Muhammad Banaras Mint "),
                              onTap: () {
                                //Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: TagsPage("${_tagList[index]['id']}","${_tagList[index]['name']}")));
                              },
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Categories : ",
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.josefinSans(
                                fontSize: 16,
                                height: 1,
                                color: StyleConstants.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 30,
                        margin: EdgeInsets.only(bottom: 10),
                        //padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.topLeft,
                        child:ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 5,
                            //itemCount: _tagList.length,
                            //itemCount: _fullViewNewsData.data.post.tags.length,
                            itemBuilder: (BuildContext context, int index) => GestureDetector(
                              //child: TagsElement((_tagList[index]['name']),
                              child: TagsElement(" Muhammad Banaras Mint "),
                              onTap: () {
                                //Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: TagsPage("${_tagList[index]['id']}","${_tagList[index]['name']}")));
                              },
                            )),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10,bottom: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Description : ",
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.josefinSans(
                          fontSize: 16,
                          height: 1,
                          color: StyleConstants.swatchRed,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  child: Text(_parseHtmlString(
                      "Awadh, Muhammad Banaras Mint, Silver Rupee,  AH 1183/11 RY,In the name of Shah Alam II,Obv: saya-e-fazle-elah couplet,Rev: sana julus zarb, trident mark, 11.30g"
                  ),
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        height: 1.5,
                        color: StyleConstants.black,
                        fontWeight: FontWeight.w400),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10,bottom: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Items you might Like",
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.josefinSans(
                          fontSize: 20,
                          height: 1,
                          color: StyleConstants.swatchRed,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                GridView(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 275,
                  ),
                  children: [
                    SimilarProductItem("https://www.indiancoinshop.com/product-pics/small/363_hke8uYLyNQEyvKDidkxW.jpg", "Awadh Muhammad Banaras Mint Silver Rupee Awadh Muhammad Banaras Mint Silver Rupee", "3550", "4000", "shareLink", "1"),
                    SimilarProductItem("https://www.indiancoinshop.com/product-pics/small/363_hke8uYLyNQEyvKDidkxW.jpg", "Awadh Muhammad Banaras Mint Silver Rupee", "3550", "4000", "shareLink", "2"),
                    SimilarProductItem("https://www.indiancoinshop.com/product-pics/small/363_hke8uYLyNQEyvKDidkxW.jpg", "Awadh Muhammad Banaras Mint Silver Rupee", "3550", "4000", "shareLink", "3"),
                    SimilarProductItem("https://www.indiancoinshop.com/product-pics/small/363_hke8uYLyNQEyvKDidkxW.jpg", "Awadh Muhammad Banaras Mint Silver Rupee", "3550", "4000", "shareLink", "4"),
                    SimilarProductItem("https://www.indiancoinshop.com/product-pics/small/363_hke8uYLyNQEyvKDidkxW.jpg", "Awadh Muhammad Banaras Mint Silver Rupee", "3550", "4000", "shareLink", "5"),
                    SimilarProductItem("https://www.indiancoinshop.com/product-pics/small/363_hke8uYLyNQEyvKDidkxW.jpg", "Awadh Muhammad Banaras Mint Silver Rupee", "3550", "4000", "shareLink", "6"),
                  ],
                  padding: EdgeInsets.only(left: 10),
                  shrinkWrap: true,
                )
              ],
            ),
          ),
      ),
    );
  }

  String _parseHtmlString(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}
