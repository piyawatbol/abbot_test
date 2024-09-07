import 'package:abbon_test/pages/contract/widgets/search_bar.dart';

import '../../config/app_import.dart';
import '../../controllers/contact_controller.dart';
import 'widgets/cantact.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(Get.context!).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: const AutoText(
            LocaleKeys.contact,
            translate: true,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  Get.toNamed(Approutes.addContact);
                },
                icon: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: GetBuilder<ContractController>(
          init: ContractController(),
          builder: (controller) {
            controller.scrollController.addListener(() {
              if (controller.scrollController.position.pixels ==
                  controller.scrollController.position.maxScrollExtent) {
                controller.getContactPage();
              }
            });

            return SizedBox(
              height: size.height,
              child: ListView(
                children: const [
                  SearchContractBar(),
                  Contract(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
