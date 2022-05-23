import 'package:get_it/get_it.dart';
import 'package:indian_coin_shop/home_page/managers/navigation_manager.dart';

void registerViewModels() {
  GetIt.I.registerSingleton<NavigationManager>(NavigationManager());
}
