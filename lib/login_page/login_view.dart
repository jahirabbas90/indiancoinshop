import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/app_constant/api_constant.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:indian_coin_shop/home_page/home_screen_main.dart';
import 'package:indian_coin_shop/login_page/forgot_password_view.dart';
import 'package:indian_coin_shop/login_page/register_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    //apiSecret();
    super.initState();
    _passwordVisible=false;
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
                      height: 500,
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
                                      "Welcome to Indian Coin Shop",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.josefinSans(
                                        fontSize: 16.0,
                                        color: StyleConstants.swatchGray,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        "Enter your login information to continue",
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
                                        prefixIcon: Icon(Icons.email_outlined,color: StyleConstants.colorNeutralgrey,),
                                      ),
                                      validator: (number) {
                                        if (number == null || number.isEmpty  && number.length>5) {
                                          return 'Enter valid email';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                                    child: TextFormField(
                                      controller: _password,
                                      obscureText: !_passwordVisible,
                                      keyboardType: TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        focusedBorder:OutlineInputBorder(
                                          borderSide: BorderSide(color: StyleConstants.colorNeutralgrey, width: 1.0),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: const BorderSide(color: StyleConstants.colorNeutralgrey, width: 1.0),
                                        ),
                                        hintText: 'Password',
                                        prefixIcon: const Icon(Icons.lock_outline,color: StyleConstants.colorNeutralgrey,),

                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            // Based on passwordVisible state choose the icon
                                            _passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: StyleConstants.swatchLightBlack,
                                          ),
                                          onPressed: () {
                                            // Update the state i.e. toogle the state of passwordVisible variable
                                            setState(() {
                                              _passwordVisible = !_passwordVisible;
                                            });
                                          },
                                        ),
                                      ),

                                      validator: (text) {
                                        if (text == null || text.isEmpty && text.length<5) {
                                          return 'Enter valid password';
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

                                  loginUser(_email.text, _password.text).then((value) =>
                                      Fluttertoast.showToast(
                                          msg: "${value}",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: StyleConstants.colorWhite,
                                          fontSize: 16.0
                                      ),
                                  );
                                }
                              },
                              child: Text(
                                "Login",
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
                                  Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: ForgotPasswordPage()));
                                },
                                child: Text(
                                  "Forgot password?",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(
                                    fontSize: 12.0,
                                    color: StyleConstants.swatchRed,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child:Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: TextButton(
                                onPressed: () {
                                  //skip();
                                  Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: Registerpage()));

                                },
                                child: RichText(
                                  text: const TextSpan(
                                    text: "Don't have an account? ",
                                    style: TextStyle(color: StyleConstants.colorNeutralgrey, fontSize: 16),
                                    children: <TextSpan>[
                                      TextSpan(text: ' Register now', style: TextStyle(color: StyleConstants.swatchRed)),
                                    ],
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

  /*child: Builder(
              builder: (context) => Center(
              ),
            ),*/

  Future <dynamic> loginUser(String email,String password) async {

    print("user_email : "+email);
    print("user_pass : "+password);
    Map<String, String> body = {
      "email": email,
      "password": password,
    };
    print(jsonEncode(body));
    final uri = Uri.parse(ApiConstants.baseUrl+"/"+ApiConstants.apiVersion+"/"+ApiConstants.login_endpoint);
    print("uri : ${uri}");
    final response =  await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body:jsonEncode(body),
    ).timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("access_token", json.decode(response.body)['data']['token']);
      pref.setString("user_id", "${json.decode(response.body)['data']['user_id']}");
      pref.setString("user_name", json.decode(response.body)['data']['name']);
      pref.setString("user_email", json.decode(response.body)['data']['email']);
      pref.setString("user_mobile", json.decode(response.body)['data']['phone']);
      Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: HomePage()));

      print(json.decode(response.body)['message']);
      //resetSession();
      return json.decode(response.body)['message'];
    } else if (response.statusCode == 500){
      return json.decode(response.body)['message'];
    }else{
      throw const HttpException('Something went wrong...');
    }
  }

  /*Future<bool> apiSecret() async {
    print('Executing update from bookmark service');
    final uri = Uri.parse(ApiConstants.baseUrl+"/"+ApiConstants.apiVersion+"/"+ApiConstants.api_secret);

    final response =  await http.post(
      uri,
      headers: {
        'x-api-token': ApiConstants.xApiToken,
      },
    ).timeout(const Duration(seconds: 5));

    if (response.statusCode == HttpStatus.ok) {
      print(response.statusCode);
      if(json.decode(response.body)['error']){
        setState(() async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString("api_secret", json.decode(response.body)['data']['api_secret']);
        });
      }
      return json.decode(response.body)['error'];
    } else {
      throw const HttpException('Something went wrong...');
    }
  }*/



  resetSession() async {
    List _posts = [];
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("postList", "$_posts");

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
            (r) => false
    );
  }

}
