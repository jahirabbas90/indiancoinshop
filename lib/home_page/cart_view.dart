import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:indian_coin_shop/home_page/widgets/cart_item.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: ${response.paymentId}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 4,
        backgroundColor: Colors.green,
        textColor: StyleConstants.colorWhite,
        fontSize: 16.0
    );

  }

  void _handlePaymentError(PaymentFailureResponse response) {
    //Fluttertoast.showToast(msg: "ERROR: " + response.code.toString() + " - " + response.message, timeInSecForIos: 4);
    Fluttertoast.showToast(
        msg: "ERROR: ${response.code.toString()}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 4,
        backgroundColor: Colors.green,
        textColor: StyleConstants.colorWhite,
        fontSize: 16.0
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    //Fluttertoast.showToast(msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: ${ response.walletName}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 4,
        backgroundColor: Colors.green,
        textColor: StyleConstants.colorWhite,
        fontSize: 16.0
    );
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_NNbwJ9tmM0fbxj',
      'amount': 28200,
      'name': 'Shaiq',
      'description': 'Payment',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 10),
                  child: Text(
                    'Cart Item',
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                        fontSize: 18,
                        height: 1,
                        color: StyleConstants.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),

              Divider(),


              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  //itemCount: _homedata.data.banners.length,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) => GestureDetector(
                    child: CartItem(),
                  ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 10),
                  child: Text(
                    'Cart Summary',
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                        fontSize: 18,
                        height: 1,
                        color: StyleConstants.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),

              Divider(height: 2,),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10),
                          child: Text(
                            'Subtotal',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.josefinSans(
                                fontSize: 14,
                                height: 1,
                                color: StyleConstants.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10),
                          child: Text(
                            '\u{20B9} 12000',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.josefinSans(
                                fontSize: 14,
                                height: 1,
                                color: StyleConstants.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10,top: 10),
                          child: Text(
                            'Discount',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.josefinSans(
                                fontSize: 14,
                                height: 1,
                                color: StyleConstants.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10,top: 10),
                          child: Text(
                            '\u{20B9} 0',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.josefinSans(
                                fontSize: 14,
                                height: 1,
                                color: StyleConstants.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10,top: 10),
                          child: Text(
                            'Cart Discount',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.josefinSans(
                                fontSize: 14,
                                height: 1,
                                color: StyleConstants.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10,top: 10),
                          child: Text(
                            '\u{20B9} 0',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.josefinSans(
                                fontSize: 14,
                                height: 1,
                                color: StyleConstants.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10,top: 10),
                          child: Text(
                            'GST',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.josefinSans(
                                fontSize: 14,
                                height: 1,
                                color: StyleConstants.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10,top: 10),
                          child: Text(
                            '\u{20B9} 600',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.josefinSans(
                                fontSize: 14,
                                height: 1,
                                color: StyleConstants.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10,top: 10),
                          child: Text(
                            'Delivery Charges',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.josefinSans(
                                fontSize: 14,
                                height: 1,
                                color: StyleConstants.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10,top: 10),
                          child: Text(
                            'Free',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.josefinSans(
                                fontSize: 14,
                                height: 1,
                                color: StyleConstants.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Divider(height: 2,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left:10,top: 10,bottom: 10),
                      child: Text(
                        'Total',
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.josefinSans(
                            fontSize: 18,
                            height: 1,
                            color: StyleConstants.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 10,right: 10),
                      child: Text(
                        '\u{20B9} 12600',
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.josefinSans(
                            fontSize: 18,
                            height: 1,
                            color: StyleConstants.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: StyleConstants.green,
                        width: 2.0),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        StyleConstants.green,
                        StyleConstants.green,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(6)),
                child: FlatButton(
                  onPressed: () {
                  },
                  child: Text(
                    "Proceed to checkout",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                      fontSize: 16.0,
                      color: StyleConstants.colorWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
