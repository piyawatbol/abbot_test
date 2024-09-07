import 'package:abbon_test/config/app_import.dart';
import '../controllers/tab_controller.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabsController>(
      init: TabsController(),
      builder: (controller) {
        return Scaffold(
          body: controller.tabs[controller.currentPage],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentPage,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColor.primaryColor,
            selectedFontSize: 12,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            iconSize: 30,
            elevation: 10,
            unselectedFontSize: 0,
            showUnselectedLabels: false,
            showSelectedLabels: true,
            onTap: (int index) {
              controller.onChangePage(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_page_outlined),
                label: "Contact",
                activeIcon: Icon(Icons.contact_page_rounded),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                activeIcon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_applications_outlined,
                ),
                activeIcon: Icon(
                  Icons.settings_applications_rounded,
                ),
                label: "Setting",
              ),
            ],
          ),
        );
      },
    );
  }
}
