import 'package:flutter/material.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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

      body: Container(),
    );
  }
}
