import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indian_coin_shop/app_constant/api_constant.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:indian_coin_shop/login_page/login_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;


class Registerpage extends StatefulWidget {
  const Registerpage({Key? key}) : super(key: key);

  @override
  _RegisterpageState createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phone = TextEditingController();
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.only(left: 16.0,top: 16.0,right: 16.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 330,
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://www.indiancoinshop.com/front/img/login-pic.jpg"),
                            ),
                          ),
                        ),
                      ),
                      Padding(
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
                            height: 550,
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
                                            "Register with us",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.josefinSans(
                                              fontSize: 20.0,
                                              color: StyleConstants.swatchRed,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),

                                       /*All Registration fields*/
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                                          child: TextFormField(
                                            controller: _name,
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              focusedBorder:OutlineInputBorder(
                                                borderSide: BorderSide(color: StyleConstants.colorNeutralgrey, width: 1.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: StyleConstants.colorNeutralgrey, width: 1.0),
                                              ),
                                              hintText: 'Full Name',
                                              prefixIcon: Icon(Icons.account_box,color: StyleConstants.colorNeutralgrey,),
                                            ),
                                            validator: (number) {
                                              if (number == null || number.isEmpty && number.length>2) {
                                                return 'Enter valid name';
                                              }
                                              return null;
                                            },
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
                                              if (number == null || number.isEmpty && number.length>7) {
                                                return 'Enter valid email';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                                          child: TextFormField(
                                            controller: _phone,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              focusedBorder:OutlineInputBorder(
                                                borderSide: BorderSide(color: StyleConstants.colorNeutralgrey, width: 1.0),
                                              ),
                                              enabledBorder: const OutlineInputBorder(
                                                borderSide: const BorderSide(color: StyleConstants.colorNeutralgrey, width: 1.0),
                                              ),
                                              hintText: 'Mobile',
                                              prefixIcon: const Icon(Icons.phone_android,color: StyleConstants.colorNeutralgrey,),
                                            ),

                                            validator: (text) {
                                              if (text == null || text.isEmpty && text.length<5) {
                                                return 'Enter valid password';
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
                                        registerUser(_name.text,_email.text,_phone.text, _password.text).then((value) =>
                                          Fluttertoast.showToast(
                                              msg: "${value}",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.green,
                                              textColor: StyleConstants.colorWhite,
                                              fontSize: 16.0
                                          ),
                                      );
                                      }
                                    },
                                    child: Text(
                                      "Register With Us",
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
                                      child: RichText(
                                        text: const TextSpan(
                                          text: "Already have an account? ",
                                          style: TextStyle(color: StyleConstants.colorNeutralgrey, fontSize: 16),
                                          children: <TextSpan>[
                                            TextSpan(text: 'Login', style: TextStyle(color: StyleConstants.swatchRed)),
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
                    ],
                  ),
                ),
              ),

            ),
          ),
        ),
      ),
    );
  }

  Future <dynamic> registerUser(String name, String email,String phone,String password) async {

    print("user_email : "+email);
    print("user_pass : "+password);
    Map<String, String> body = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    };
    print(jsonEncode(body));
    final uri = Uri.parse(ApiConstants.baseUrl+"/"+ApiConstants.apiVersion+"/"+ApiConstants.register_endpoint);
    print("uri : ${uri}");
    final response =  await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body:jsonEncode(body),
    ).timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {

      Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: LoginPage()));

      print(json.decode(response.body)['message']);
      //resetSession();
      return json.decode(response.body)['message'];
    } else if (response.statusCode == 500){
      return json.decode(response.body)['message'];
    }else{
      throw const HttpException('Something went wrong...');
    }
  }
}
