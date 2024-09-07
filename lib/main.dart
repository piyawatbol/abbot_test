import 'package:abbon_test/pages/tab_screen.dart';
import 'package:abbon_test/utils/app_local.dart';
import 'config/app_import.dart';

void main() async {
  await initializer();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        AppLocal.eng,
        AppLocal.thai,
      ],
      path: 'assets/translations',
      saveLocale: true,
      startLocale: AppLocal.eng,
      fallbackLocale: AppLocal.eng,
      child: const MyApp(),
    ),
  );
}

Future initializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      getPages: Approutes.getPages,
      debugShowCheckedModeBanner: false,
      home: const TabScreen(),
    );
  }
}
