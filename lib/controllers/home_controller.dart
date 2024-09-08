import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/app_import.dart';

class HomeController extends GetxController {
  File? imageFile;
  XFile? pickedFile;

  pickImage(ImageSource image) async {
    final ImagePicker picker = ImagePicker();
    pickedFile = await picker.pickImage(source: image);
    if (pickedFile != null) {
      imageFile = File(pickedFile!.path);
      update();
      Get.back();
    }
  }

  getCurrentLocation() async {
    LocationPermission permission;

    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      Log.show("Location services are disabled.");
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Log.show("Location permission denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Log.show("Location permission denied forever.");
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition();
      Log.show("Current Position: $position");
      lauchURl(position.latitude, position.longitude);
    } catch (e) {
      Log.show("Failed to get current position: $e");
    }
  }

  void lauchURl(latitude, longitude) async {
    final url = Uri.parse(
        'https://www.google.co.th/maps/@$latitude,$longitude,15z?hl=th');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  openTel() {
    final Uri url = Uri(scheme: "tel", path: "099999999");
    launchUrl(url);
  }

  Future launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'piyawatbol@gmail.com',
      queryParameters: {
        'subject': 'Hello Form Piyawat Sakdadet',
        'body': 'I hope to collaborate with Abbon'
      },
    );

    if (await canLaunchUrl(Uri.parse(emailUri.toString()))) {
      await launchUrl(Uri.parse(emailUri.toString()));
    } else {
      throw 'Could not launch email app';
    }
  }

  Future<void> openLine() async {
    const String url = 'https://line.me/ti/p/~pywsdd_050943';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
      );
    } else {
      throw 'Could not launch Safari';
    }
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
                leading: const Icon(Icons.camera_alt),
                title: const AutoText(
                  LocaleKeys.camera,
                  translate: true,
                ),
                onTap: () => pickImage(ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const AutoText(
                  LocaleKeys.gallery,
                  translate: true,
                ),
                onTap: () => pickImage(ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );
  }
}
