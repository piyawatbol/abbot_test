import 'package:abbon_test/controllers/setting_controller.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import '../../config/app_import.dart';

class AlertChageLang extends StatelessWidget {
  final String lang;
  const AlertChageLang({super.key, required this.lang});

  static showPopup({required String lang}) {
    return showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertChageLang(
          lang: lang,
        );
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
                LocaleKeys.doYouWant,
                translate: true,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              AutoText(
                LocaleKeys.youNeed,
                translate: true,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                color: Colors.grey.shade500,
              ),
              const SizedBox(height: 30),
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
                  GetBuilder<SettingController>(
                    init: SettingController(),
                    builder: (controller) {
                      return Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: LocaleKeys.ok,
                            ontap: () {
                              if (lang == "thai") {
                                EasyLocalization.of(context)
                                    ?.setLocale(const Locale('th', 'TH'));
                                FlutterExitApp.exitApp(iosForceExit: true);
                              } else if (lang == "eng") {
                                EasyLocalization.of(context)
                                    ?.setLocale(const Locale('en', 'US'));
                                FlutterExitApp.exitApp(iosForceExit: true);
                              }
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
