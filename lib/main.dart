import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islam_app_c10_sun_4pm/config/application_theme_manager.dart';
import 'package:islam_app_c10_sun_4pm/config/settings_provider.dart';
import 'package:islam_app_c10_sun_4pm/layout/layout_view.dart';
import 'package:islam_app_c10_sun_4pm/moduls/hadeth/page/hadeth_detials_view.dart';
import 'package:islam_app_c10_sun_4pm/moduls/quran/page/quran_details.dart';
import 'package:islam_app_c10_sun_4pm/moduls/splash/page/splash_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      title: 'Isalmi App',
      debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManager.lightTheme,
      darkTheme: ApplicationThemeManager.darkTheme,
      themeMode: vm.currentThemeMode,
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      locale: Locale(vm.currentLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // supportedLocales: const [
      // Locale('en'), // English
      // Locale('ar'), // Arabic
      // ],
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        LayoutView.routeName: (context) => const LayoutView(),
        QuranDetailsView.routeName: (context) => const QuranDetailsView(),
        HadethDetailsView.routeName: (context) => const HadethDetailsView(),
      },
    );
  }
}
