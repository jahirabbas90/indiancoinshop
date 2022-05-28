import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:indian_coin_shop/login_page/login_view.dart';
import 'package:page_transition/page_transition.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _email = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    //apiSecret();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme(),
      ),
      home: Container(
        decoration:const BoxDecoration(
          color: StyleConstants.login_back_color,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            // title: Text("Second Screen"),
            backgroundColor: StyleConstants.login_back_color,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back,
                color: StyleConstants.swatchRed,),
              onPressed: ()=> Navigator.of(context).pop(),
              //=> Navigator.of(context).pop(),
            ),
          ),
          body: ProgressHUD(
            child: Builder(
              builder: (context) => Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0,top: 40.0,bottom: 7.0,right: 10.0),
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0,top: 40.0,bottom: 7.0,right: 20.0),
                      margin: EdgeInsets.all(16.0),
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: StyleConstants.colorWhite,
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 1.0,
                          color: Colors.white,
                        ),
                      ),

                      child: Column(
                        //physics: const AlwaysScrollableScrollPhysics(),
                        children:[
                          Center(
                            child: Container(
                              height: 49.0,
                              width: 200.0,
                              padding: EdgeInsets.only(left: 64.0,right: 64.0),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/logo.png'),
                                  fit: BoxFit.contain,
                                ),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ),
                          Center(
                            child: Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Forgot Password",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.josefinSans(
                                        fontSize: 20.0,
                                        color: StyleConstants.swatchRed,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        "Enter your email to reset your password.",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.josefinSans(
                                          fontSize: 16.0,
                                          color: StyleConstants.colorNeutralgrey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                                    child: TextFormField(
                                      controller: _email,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        focusedBorder:OutlineInputBorder(
                                          borderSide: BorderSide(color: StyleConstants.colorNeutralgrey, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: StyleConstants.colorNeutralgrey, width: 1.0),
                                        ),
                                        hintText: 'Email',
                                        prefixIcon: Icon(Icons.email,color: StyleConstants.colorNeutralgrey,),
                                      ),
                                      validator: (number) {
                                        if (number == null || number.isEmpty && number.length<10 && number.length>9) {
                                          return 'Enter valid phone number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),

                                ],

                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: double.infinity,
                            margin: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: StyleConstants.yellow_button_border,
                                    width: 2.0),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: <Color>[
                                    StyleConstants.yellow_button,
                                    StyleConstants.yellow_button_border,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(6)),
                            child: FlatButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  // TODO submit
                                  final progress = ProgressHUD.of(context);
                                  progress?.showWithText('Loading...');
                                  Future.delayed(Duration(seconds: 1), () {
                                    progress?.dismiss();
                                  });
                                  /*loginUser(_mobile.text, _password.text).then((value) =>
                                      Fluttertoast.showToast(
                                          msg: "${value}",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: StyleConstants.colorWhite,
                                          fontSize: 16.0
                                      ),
                                  );*/
                                }
                              },
                              child: Text(
                                "Send Password Reset Link",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.josefinSans(
                                  fontSize: 18.0,
                                  color: StyleConstants.colorWhite,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child:Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: LoginPage()));
                                  },
                                child: Text(
                                  "Back to login",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(
                                    fontSize: 14.0,
                                    color: StyleConstants.swatchRed,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ),
          ),
        ),
      ),
    );
  }
}
