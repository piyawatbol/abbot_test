import 'package:abbon_test/pages/contract/contract_screen.dart';
import 'package:abbon_test/pages/home/home_screen.dart';
import 'package:abbon_test/pages/setting/setting_screen.dart';

import '../config/app_import.dart';

class TabsController extends GetxController {
  int currentPage = 0;

  List<Widget> tabs = [
    const ContactScreen(),
    const HomeScreen(),
    const SettingScreen(),
  ];

  onChangePage(index) {
    currentPage = index;
    update();
  }
}
