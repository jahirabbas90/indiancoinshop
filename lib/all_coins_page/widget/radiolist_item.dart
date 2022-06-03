import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';

class RadioListItem extends StatefulWidget {
  const RadioListItem({Key? key}) : super(key: key);

  @override
  _RadioListItemState createState() => _RadioListItemState();
}

class _RadioListItemState extends State<RadioListItem> {
  var _result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
          padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Default Sorting',
                maxLines: 1,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.josefinSans(
                    fontSize: 16,
                    height: 1,
                    color: StyleConstants.swatchRed,
                    fontWeight: FontWeight.w600),
              ),
              RadioListTile(
                  title: Text(
                    'Price - High to Low',
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                        fontSize: 16,
                        height: 1,
                        color: StyleConstants.swatchRed,
                        fontWeight: FontWeight.w600),
                  ),
                  value: 4,
                  groupValue: _result,
                  activeColor: StyleConstants.swatchRed,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  }),
              RadioListTile(
                  title: Text(
                    'Price - Low to High',
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                        fontSize: 16,
                        height: 1,
                        color: StyleConstants.swatchRed,
                        fontWeight: FontWeight.w600),
                  ),
                  value: 5.4,
                  groupValue: _result,
                  activeColor: StyleConstants.swatchRed,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  }),
              RadioListTile(
                  title: Text(
                    'Sort by Latest',
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                        fontSize: 16,
                        height: 1,
                        color: StyleConstants.swatchRed,
                        fontWeight: FontWeight.w600),
                  ),
                  value: 6,
                  groupValue: _result,
                  activeColor: StyleConstants.swatchRed,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  }),
              RadioListTile(
                  title: Text(
                    'Sort by Oldest',
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                        fontSize: 16,
                        height: 1,
                        color: StyleConstants.swatchRed,
                        fontWeight: FontWeight.w600),
                  ),
                  value: 7,
                  groupValue: _result,
                  activeColor: StyleConstants.swatchRed,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  }),
              //Text(_result == 7 ? 'Correct!' : 'Please chose the right answer!')
            ],
          )),
    );
  }
}
