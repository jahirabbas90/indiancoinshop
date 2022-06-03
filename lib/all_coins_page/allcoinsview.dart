import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/all_coins_page/widget/radiolist_item.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:indian_coin_shop/home_page/widgets/all_coin_item.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AllCoinsPage extends StatelessWidget {
  final String title;
  const AllCoinsPage(this.title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomSheet:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0,left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: StyleConstants.colorNeutralgrey,
                          width: 2.0),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          StyleConstants.colorNeutralgrey,
                          StyleConstants.colorNeutralgrey,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  child: FlatButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return Card(
                            //semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            child: Container(
                              height: 335,
                              color: StyleConstants.colorWhite,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      height:335,
                                        child: RadioListItem()),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.sort,color: StyleConstants.colorWhite,),
                        Text(
                          "Sorting",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.josefinSans(
                            fontSize: 16.0,
                            color: StyleConstants.colorWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0,right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: StyleConstants.colorNeutralgrey,
                          width: 2.0),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          StyleConstants.colorNeutralgrey,
                          StyleConstants.colorNeutralgrey,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  child: FlatButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                      return Card(
                        //semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        child: Container(
                              height: 400,
                              color: StyleConstants.colorNeutralgrey,
                              child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text('Modal BottomSheet'),
                                        ElevatedButton(
                                        child: const Text('Close BottomSheet'),
                                        onPressed: () => Navigator.pop(context),
                                        )
                                      ],
                                    ),
                                   ),
                                  ),
                      );
                               },
                            );
                          },
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.filter_alt_outlined,color: StyleConstants.colorWhite,),
                        Text(
                          "Filter",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.josefinSans(
                            fontSize: 16.0,
                            color: StyleConstants.colorWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        appBar: AppBar(
          title: Text(""+title.toUpperCase(),style: GoogleFonts.josefinSans(
              fontSize: 16,
              height: 1,
              color: StyleConstants.colorWhite,
              fontWeight: FontWeight.w600),
          ),
          backgroundColor: StyleConstants.swatchRed,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back,
                color: Colors.white,),
              onPressed: ()=> Navigator.of(context).pop(),
            //=> Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(top: 10,bottom: 60,right: 10),
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5,
                mainAxisExtent: 270,
              ),
              children: [
                AllCointItem("https://www.indiancoinshop.com/product-pics/small/363_hke8uYLyNQEyvKDidkxW.jpg", "Awadh Muhammad Banaras Mint Silver Rupee Awadh Muhammad Banaras Mint Silver Rupee", "3550", "4000", "shareLink", "1"),
                AllCointItem("https://www.indiancoinshop.com/product-pics/small/363_hke8uYLyNQEyvKDidkxW.jpg", "Awadh Muhammad Banaras Mint Silver Rupee", "3550", "4000", "shareLink", "2"),
                AllCointItem("https://www.indiancoinshop.com/product-pics/small/363_hke8uYLyNQEyvKDidkxW.jpg", "Awadh Muhammad Banaras Mint Silver Rupee", "3550", "4000", "shareLink", "3"),
                AllCointItem("https://www.indiancoinshop.com/product-pics/small/363_hke8uYLyNQEyvKDidkxW.jpg", "Awadh Muhammad Banaras Mint Silver Rupee", "3550", "4000", "shareLink", "4"),
                AllCointItem("https://www.indiancoinshop.com/product-pics/small/363_hke8uYLyNQEyvKDidkxW.jpg", "Awadh Muhammad Banaras Mint Silver Rupee", "3550", "4000", "shareLink", "5"),
                AllCointItem("https://www.indiancoinshop.com/product-pics/small/363_hke8uYLyNQEyvKDidkxW.jpg", "Awadh Muhammad Banaras Mint Silver Rupee", "3550", "4000", "shareLink", "6"),
              ],
              padding: EdgeInsets.only(left: 10),
              shrinkWrap: true,
            ),
          ),
          ),
      ),
    );
  }

}
