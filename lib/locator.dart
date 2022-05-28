import 'package:get_it/get_it.dart';
import 'package:indian_coin_shop/home_page/managers/homefeed_manager.dart';
import 'package:indian_coin_shop/home_page/managers/navigation_manager.dart';
import 'package:indian_coin_shop/home_page/service/home_service.dart';

void registerViewModels() {
  GetIt.I.registerSingleton<NavigationManager>(NavigationManager());
  GetIt.I.registerSingleton<MyHomeService>(MyHomeService());


  GetIt.I.registerSingleton<HomeFeedManager>(HomeFeedManager());

}
