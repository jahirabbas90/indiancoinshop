import 'package:flutter/material.dart';
import 'package:indian_coin_shop/home_page/widgets/all_coin_item.dart';
import 'package:indian_coin_shop/home_page/widgets/wishlist_item.dart';

class WishView extends StatelessWidget {
  const WishView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
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
            WishListItem("https://www.indiancoinshop.com/product-pics/small/363_hke8uYLyNQEyvKDidkxW.jpg", "Awadh Muhammad Banaras Mint Silver Rupee Awadh Muhammad Banaras Mint Silver Rupee", "3550", "4000", "shareLink", "1"),
            WishListItem("https://www.indiancoinshop.com/product-pics/small/363_hke8uYLyNQEyvKDidkxW.jpg", "Awadh Muhammad Banaras Mint Silver Rupee", "3550", "4000", "shareLink", "2"),
          ],
          padding: EdgeInsets.only(left: 10,right: 10,top: 10),
          shrinkWrap: true,
        ),
      ),
    );
  }
}
