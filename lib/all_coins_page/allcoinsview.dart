import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:indian_coin_shop/home_page/widgets/all_coin_item.dart';

class AllCoinsPage extends StatelessWidget {
  final String title;
  const AllCoinsPage(this.title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          margin: EdgeInsets.only(top: 10,bottom: 10,right: 10),
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
    );
  }
}
