import '../../../config/app_import.dart';
import '../../../controllers/contact_controller.dart';
import '../../../models/contract/contract_model.dart';

class Contract extends StatelessWidget {
  const Contract({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(Get.context!).size;
    return GetBuilder<ContractController>(
      init: ContractController(),
      builder: (controller) {
        List<ContractModel>? contactList;
        if (controller.search.text.length >= 3) {
          contactList = controller.searchList;
        } else {
          contactList = controller.contactList;
        }

        return SizedBox(
          height: size.height * 0.7,
          child: ListView.builder(
            controller: controller.scrollController,
            shrinkWrap: true,
            itemCount: controller.isLoadingMore
                ? contactList.length + 1
                : contactList.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == contactList!.length) {
                return const SizedBox(
                  height: 100,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                );
              } else {
                ContractModel contact = contactList[index];
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 0.3,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (context.locale.toString() == "th_TH") ...{
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoText(
                              "${contact.thFirstName} ${contact.thLastName}",
                              fontWeight: FontWeight.w500,
                            ),
                            AutoText(
                              "อายุ ${contact.age}",
                            ),
                          ],
                        ),
                      } else ...{
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoText(
                              "${contact.enFirstName} ${contact.enLastName}",
                              fontWeight: FontWeight.w500,
                            ),
                            AutoText(
                              "Age ${contact.age}",
                            ),
                          ],
                        ),
                      },
                      GestureDetector(
                          onTap: () {
                            controller.removeContact(index);
                          },
                          child: const Icon(Icons.delete))
                    ],
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
