import 'package:flutter_command/flutter_command.dart';
import 'package:get_it/get_it.dart';
import 'package:indian_coin_shop/home_page/model/home_data_model.dart';
import 'package:indian_coin_shop/home_page/service/home_service.dart';

class HomeFeedManager{
  late Command<void, HomeDataModel> homefeedData;

  HomeFeedManager(){
    homefeedData = Command.createAsyncNoParam<HomeDataModel>(GetIt.I<MyHomeService>().update,
        HomeDataModel(data:Data(banners:[],homeBanners:[]), message: ''
        ),);

    //updateBookmarkFeedCmd.execute();
  }
}