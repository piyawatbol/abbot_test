import 'package:abbon_test/widgets/alert/alert_change_lang.dart';
import 'package:app_settings/app_settings.dart';
import '../config/app_import.dart';

class SettingController extends GetxController {
  openNoti() {
    AppSettings.openAppSettings(type: AppSettingsType.notification);
  }

  showModalbottom() {
    var size = MediaQuery.of(Get.context!).size;
    return showModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: size.height * 0.2,
          child: Column(
            children: [
              ListTile(
                  title: const AutoText(
                    LocaleKeys.thai,
                    translate: true,
                  ),
                  onTap: () {
                    AlertChageLang.showPopup(lang: "thai");
                  }),
              ListTile(
                  title: const AutoText(
                    LocaleKeys.eng,
                    translate: true,
                  ),
                  onTap: () {
                    AlertChageLang.showPopup(lang: "eng");
                  }),
            ],
          ),
        );
      },
    );
  }
}
