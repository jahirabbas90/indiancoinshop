import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/all_coins_page/allcoinsview.dart';
import 'package:indian_coin_shop/app_constant/api_constant.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:indian_coin_shop/home_page/managers/homefeed_manager.dart';
import 'package:indian_coin_shop/home_page/widgets/all_coin_item.dart';
import 'package:indian_coin_shop/home_page/widgets/home_item.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;


class HomeView extends StatefulWidget with GetItStatefulWidgetMixin{
   HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with GetItStateMixin{
  late List homeDataArray=[];
  late List homeDataSliderArray=[];
  String homeImage="";
  int _page = 1;
  bool isLoading=true;


  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      isLoading = true;
    });
    //getHomeData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final _homedata = watchX((HomeFeedManager x) => x.homefeedData);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      child: Center(
        //isLoading? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(StyleConstants.swatchRed),semanticsLabel: "Loading ...",):
        child:Column(
          children: [
            Container(
              child: Image.network(
                "https://www.indiancoinshop.com/promotion-pics/1_coming-soon.jpg",
                fit: BoxFit.fitWidth,
              ),
            ),

            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _homedata.data.banners.length,
                itemBuilder: (BuildContext context, int index) => GestureDetector(
                  child: HomeItem(
                    _homedata.data.banners[index].img,
                    "",
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Featured Products",
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.josefinSans(
                          fontSize: 20,
                          height: 1,
                          color: StyleConstants.swatchRed,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child:ElevatedButton(

                      child:Row(
                        children: [
                          Text(
                              "View All".toUpperCase(),
                              style: TextStyle(fontSize: 14,color: StyleConstants.yellow_button)
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: StyleConstants.yellow_button,
                            size: 24.0,
                          ),
                        ],
                      ),

                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(StyleConstants.colorWhite),
                          backgroundColor: MaterialStateProperty.all<Color>(StyleConstants.colorWhite),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  side: BorderSide(color: StyleConstants.yellow_button)
                              )
                          )
                      ),
                      onPressed: () =>Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: AllCoinsPage("title"))),

                    ),
                  ),
                ],
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
          ],
        ),
      ),

    );
  }

  Future <dynamic> getHomeData() async {
    setState(() {
      isLoading = true;
    });
    final response =  await http.get(
      ApiConstants.homeNewsFeedUri,
      headers: {"Content-Type": "application/json"},
    ).timeout(const Duration(seconds: 5));

    print(response.statusCode);

    if (response.statusCode == 200) {
      homeDataArray=json.decode(response.body)['data']['banners'];
      homeDataSliderArray=json.decode(response.body)['data']['home_banners'];
      homeImage=json.decode(response.body)['data']['home_banners'][0]['img'];
      print(homeImage);
      print(homeDataArray);
      setState(() {
        isLoading = false;
      });
      return json.decode(response.body)['message'];
    } else if (response.statusCode == 500){
      return json.decode(response.body)['message'];
    }else{
      throw const HttpException('Something went wrong...');
    }
  }
}
