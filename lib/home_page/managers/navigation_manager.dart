import 'package:flutter_command/flutter_command.dart';

class NavigationManager {
  late Command<int, int> setNavigationIndexCmd;

  NavigationManager() {
    setNavigationIndexCmd =
        Command.createSync((navigationIndex) => navigationIndex, 0);
  }
}
