import 'package:abbon_test/controllers/contact_controller.dart';

import '../../config/app_import.dart';

class AlertAddContract extends StatelessWidget {
  const AlertAddContract({super.key});

  static showPopup() {
    return showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const AlertAddContract();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: size.width * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AutoText(
                LocaleKeys.confirmAdd,
                translate: true,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomButton2(
                        text: LocaleKeys.cancel,
                        ontap: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GetBuilder<ContractController>(
                    init: ContractController(),
                    builder: (controller) {
                      return Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: LocaleKeys.ok,
                            ontap: () {
                              controller.confirmAdd();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
