import 'package:abbon_test/data/contact_data.dart';
import 'package:abbon_test/widgets/alert/alert_add_contract.dart';
import 'package:flutter/cupertino.dart';
import '../config/app_import.dart';
import '../models/contract/contract_model.dart';

class ContractController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final TextEditingController search = TextEditingController();
  final TextEditingController thFirstName = TextEditingController();
  final TextEditingController thLastName = TextEditingController();
  final TextEditingController enFirstName = TextEditingController();
  final TextEditingController enLastName = TextEditingController();
  final TextEditingController age = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<ContractModel> contactList = [];
  List<ContractModel> allContacts = [];
  List<ContractModel> searchList = [];
  int currentPage = 1;
  final int itemsPerPage = 10;
  bool isLoadingMore = false;

  @override
  void onInit() {
    loadAllContacts();
    getContactPage();
    super.onInit();
  }

  void loadAllContacts() {
    allContacts =
        contactData.map((item) => ContractModel.fromJson(item)).toList();
  }

  Future<void> getContactPage() async {
    isLoadingMore = true;
    update();

    final int start = (currentPage - 1) * itemsPerPage;
    final int end = currentPage * itemsPerPage;

    if (start < allContacts.length) {
      contactList.addAll(allContacts.sublist(
          start, end > allContacts.length ? allContacts.length : end));
      currentPage++;
      contactList.shuffle();
      update();
    }
    await Future.delayed(const Duration(milliseconds: 5000));
    isLoadingMore = false;
    update();
  }

  Future<void> addContact() async {
    final isAnyNameFieldContainsNumber = [
      thFirstName.text,
      thLastName.text,
      enFirstName.text,
      enLastName.text,
    ].any((name) => RegExp(r'\d').hasMatch(name));

    if (thFirstName.text.isEmpty ||
        thLastName.text.isEmpty ||
        enFirstName.text.isEmpty ||
        enLastName.text.isEmpty ||
        age.text.isEmpty ||
        int.tryParse(age.text) == null ||
        isAnyNameFieldContainsNumber) {
      Get.snackbar(
        'Error',
        'Please fill in all fields correctly. Names should not contain numbers and Age must be a valid number.',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }
    AlertAddContract.showPopup();
  }

  confirmAdd() {
    final newContact = ContractModel(
      thFirstName: thFirstName.text,
      thLastName: thLastName.text,
      enFirstName: enFirstName.text,
      enLastName: enLastName.text,
      age: int.tryParse(age.text),
    );

    contactList.insert(0, newContact);
    allContacts.insert(0, newContact);

    thFirstName.clear();
    thLastName.clear();
    enFirstName.clear();
    enLastName.clear();
    age.clear();
    Get.back();
    Get.back();
    Get.back();

    update();
  }

  Future<bool> showConfirmationDialog() async {
    return await showCupertinoDialog<bool>(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: const Text('Confirm'),
              content: const Text('Are you sure you want to add this contact?'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: const Text('Confirm'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }

  removeContact(int index) {
    if (index >= 0 && index < contactList.length) {
      contactList.removeAt(index);
      update();
    }
  }

  void onSearch() {
    String searchText = search.text;
    if (searchText.isEmpty) {
      searchList = List.from(contactList);
    } else {
      searchList = contactList.where((contact) {
        final thFullName =
            '${contact.thFirstName} ${contact.thLastName}'.toLowerCase();
        final enFullName =
            '${contact.enFirstName} ${contact.enLastName}'.toLowerCase();

        return thFullName.contains(searchText.toLowerCase()) ||
            enFullName.contains(searchText.toLowerCase());
      }).toList();
    }
    update();
  }
}
