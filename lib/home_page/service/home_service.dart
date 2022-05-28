import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:indian_coin_shop/app_constant/api_constant.dart';
import 'package:indian_coin_shop/home_page/model/home_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class MyHomeService{
  Future<HomeDataModel> update() async {
    final response = await http.get(
      ApiConstants.homeNewsFeedUri,
      headers: {"Content-Type": "application/json"},
    ).timeout(const Duration(seconds: 5));

    if (response.statusCode == HttpStatus.ok) {
      HomeDataModel homeData = await compute(
            (String data) => HomeDataModel.fromJson(json.decode(data)),
        response.body,
      );

      return homeData;
    } else {
      throw const HttpException('Something went wrong...');
    }
  }

}