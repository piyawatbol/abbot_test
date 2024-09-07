import 'package:abbon_test/pages/contract/add_contract_screen.dart';

import '../config/app_import.dart';

class Approutes {
  static const addContact = '/add_contact';

  static final getPages = [
    GetPage(name: addContact, page: () => const AddContractScreen()),
  ];
}
