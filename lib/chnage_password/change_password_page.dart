import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:indian_coin_shop/app_constant/api_constant.dart';
import 'package:indian_coin_shop/app_constant/style_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _oldPass = TextEditingController();
  TextEditingController _newPass = TextEditingController();
  TextEditingController _confirm_pass = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _newPass.addListener((){
      setState(() {
        print("value: ${_newPass.text}");
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: Container(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: StyleConstants.colorWhite,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back,
                color:StyleConstants.swatchRed,),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: <Widget>[
            ],
          ),
          body: ProgressHUD(
            child:Builder(
              builder: (context)=>Center(
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
                      padding: const EdgeInsets.only(left: 32.0,top: 40.0,bottom: 24.0,right: 32.0),
                      margin: const EdgeInsets.all(16.0),
                      height: 480,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: StyleConstants.colorWhite,
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 1.0,
                          color: Colors.white,
                        ),
                      ),

                      child: ListView(
                        children:[

                          Center(
                            child: Container(
                              height: 49.0,
                              width: 200.0,
                              padding: const EdgeInsets.only(left: 64.0,right: 64.0),
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
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Change Password",
                                        style: TextStyle(color: StyleConstants.swatchBlack,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600) ),
                                  ),

                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Please fill the details to change password",
                                        style: const TextStyle(color: StyleConstants.colorNeutralgrey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400) ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),

                                    child: TextFormField(
                                      controller: _oldPass,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        focusedBorder:OutlineInputBorder(
                                          borderSide: BorderSide(color: StyleConstants.colorNeutralgrey, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: StyleConstants.colorNeutralgrey, width: 1.0),
                                        ),
                                        hintText: 'Old Password',
                                        prefixIcon: Icon(Icons.lock,color: StyleConstants.colorNeutralgrey,),
                                      ),
                                      validator: (number) {
                                        if (number == null || number.isEmpty) {
                                          return 'Enter valid password';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),

                                    child: TextFormField(
                                      controller: _newPass,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        focusedBorder:OutlineInputBorder(
                                          borderSide: BorderSide(color: StyleConstants.colorNeutralgrey, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: StyleConstants.colorNeutralgrey, width: 1.0),
                                        ),
                                        hintText: 'New Password',
                                        prefixIcon: Icon(Icons.lock,color: StyleConstants.colorNeutralgrey,),
                                      ),
                                      validator: (number) {
                                        if (number == null || number.isEmpty) {
                                          return 'Enter valid password';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),

                                    child: TextFormField(
                                        controller: _confirm_pass,
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          fillColor: Colors.white,
                                          focusedBorder:OutlineInputBorder(
                                            borderSide: BorderSide(color: StyleConstants.colorNeutralgrey, width: 1.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: StyleConstants.colorNeutralgrey, width: 1.0),
                                          ),
                                          hintText: 'Confirm Password',
                                          prefixIcon: Icon(Icons.lock,color: StyleConstants.colorNeutralgrey,),
                                        ),
                                        validator: (validator) {
                                          if (validator!.isEmpty) return 'Empty';
                                          if (validator != _newPass.text)
                                            return 'The passwords do not match';
                                          return null;
                                        }
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
                                border: Border.all(color: StyleConstants.swatchRed,
                                    width: 2.0),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: <Color>[
                                    StyleConstants.swatchRed,
                                    StyleConstants.swatchRed,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(6)),
                            child: FlatButton(
                              onPressed: () {
                                print( _newPass.text);
                                print( "button Pressed");
                                print( _confirm_pass.text.toLowerCase().toString());
                                if (_formkey.currentState!.validate()) {
                                  // TODO submit
                                  final progress = ProgressHUD.of(context);
                                  progress?.showWithText('Loading...');
                                  Future.delayed(Duration(seconds: 1), () {
                                    progress?.dismiss();
                                  });
                                  changePassword().then((value) =>
                                      Fluttertoast.showToast(
                                          msg: "${value}",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: StyleConstants.green,
                                          textColor: StyleConstants.colorWhite,
                                          fontSize: 16.0
                                      ),
                                  );
                                }
                              },
                              child: const Text(
                                'Submit',
                                style: TextStyle(color: Colors.white, fontSize: 16.0),
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

  Future <dynamic> changePassword() async {
    print('change password');
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String access_token = prefs.getString('access_token') ?? '';
    String api_secret = prefs.getString('api_secret') ?? '';
    String user_id = prefs.getString('user_id') ?? '';
    print("access_token : "+access_token);

    final response =  await http.post(
      ApiConstants.change_password_endpoint,
      headers: {
        'x-api-token': api_secret,
        'Authorization': 'Bearer '+access_token,
      },
      body: {"old_password":_oldPass.text,"new_password":_newPass.text,"user_id":user_id},
    ).timeout(const Duration(seconds: 5));

    if (response.statusCode == HttpStatus.ok) {
      if(!json.decode(response.body)['error']){
        print(json.decode(response.body)['message']);
        return json.decode(response.body)['message'];
      }else{
        print(json.decode(response.body)['message']);
        return json.decode(response.body)['message'];
      }
      /*Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => EnterNewMobileNo(_mobile.text,)),
              (r) => false
      );*/

    } else {
      throw const HttpException('Something went wrong...');
    }
  }
}
