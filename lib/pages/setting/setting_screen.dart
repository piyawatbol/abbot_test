import 'package:abbon_test/controllers/setting_controller.dart';
import '../../config/app_import.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const AutoText(
          LocaleKeys.setting,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          translate: true,
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: GetBuilder<SettingController>(
          init: SettingController(),
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                CustomButton(
                  width: size.width * 0.6,
                  text: LocaleKeys.settingNoti,
                  ontap: () {
                    controller.openNoti();
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  width: size.width * 0.6,
                  text: LocaleKeys.language,
                  ontap: () {
                    controller.showModalbottom();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
