import 'package:flutter/material.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';

class ProductImageItem extends StatefulWidget {
  final String pro_img;
  const ProductImageItem(this.pro_img,{Key? key}) : super(key: key);

  @override
  State<ProductImageItem> createState() => _ProductImageItemState();
}



class _ProductImageItemState extends State<ProductImageItem> {

  bool isClicked=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isClicked=false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: (){
          setState(() {
            isClicked=true;
          });
        },
        child: Container(
          width: 58,
          height: 58,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: isClicked?StyleConstants.green:StyleConstants.colorNeutralgrey),
          ),
          child: Image.network(
            widget.pro_img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
