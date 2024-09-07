import 'dart:io';
import 'package:abbon_test/controllers/home_controller.dart';

import '../../config/app_import.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const AutoText(
          "home",
          fontSize: 24,
          fontWeight: FontWeight.w500,
          translate: true,
        ),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                const SizedBox(height: 20),
                buildSelectImage(controller),
                const SizedBox(height: 50),
                CustomButton(
                  width: size.width * 0.5,
                  text: LocaleKeys.location,
                  ontap: () {
                    controller.getCurrentLocation();
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  width: size.width * 0.5,
                  text: LocaleKeys.telephone,
                  ontap: () {
                    controller.tel();
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  width: size.width * 0.5,
                  text: LocaleKeys.email,
                  ontap: () {
                    controller.launchEmail();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildSelectImage(HomeController controller) {
    return GestureDetector(
      onTap: () {
        controller.showModalbottom();
      },
      child: CircleAvatar(
        radius: 90,
        backgroundColor: Colors.grey.shade300,
        backgroundImage: controller.pickedFile != null
            ? FileImage(File(controller.pickedFile!.path))
            : null,
        child: controller.pickedFile != null
            ? null
            : Icon(
                Icons.image,
                color: Colors.grey.shade600,
                size: 30,
              ),
      ),
    );
  }
}
