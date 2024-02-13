import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islam_app_c10_sun_4pm/moduls/hadeth/page/hadeth_view.dart';
import 'package:islam_app_c10_sun_4pm/moduls/quran/page/quran_view.dart';
import 'package:islam_app_c10_sun_4pm/moduls/radio/page/radio_view.dart';
import 'package:islam_app_c10_sun_4pm/moduls/settings/page/settings_view.dart';
import 'package:islam_app_c10_sun_4pm/moduls/tasbeh/page/tasbeh_view.dart';

class LayoutView extends StatefulWidget {
  static const String routeName = "layout";

  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;
  List<Widget> screens = [
    QuranView(),
    const HadethView(),
    const TasbehView(),
    const RadioView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context)!;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/main_background.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami),
        ),
        body: screens[currentIndex], // depending on index
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(
                  "assets/images/quran_icn.png",
                ),
              ),
              label: local.quran,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(
                  "assets/images/hadeth_icn.png",
                ),
              ),
              label: local.hadith,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(
                  "assets/images/sebha_icn.png",
                ),
              ),
              label: local.tasbih,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(
                  "assets/images/radio_icn.png",
                ),
              ),
              label: local.radio,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.settings,
              ),
              label: local.settings,
            ),
          ],
        ),
      ),
    );
  }
}
