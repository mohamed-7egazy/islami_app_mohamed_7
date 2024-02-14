import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islam_app_c10_sun_4pm/config/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  List<String> languageList = ["English", "عربى"];
  List<String> themeList = ["Light", "Dark"];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var vm = Provider.of<settingProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            lang.language,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          CustomDropdown(
              decoration: CustomDropdownDecoration(
                expandedSuffixIcon: Icon(Icons.keyboard_arrow_up,
                    color:
                        vm.isDark() ? const Color(0xFFFACC10) : Colors.black),
                closedSuffixIcon: Icon(
                  Icons.keyboard_arrow_down,
                  color: vm.isDark() ? const Color(0xFFFACC10) : Colors.black,
                ),
                closedFillColor:
                    vm.isDark() ? const Color(0xFF141A2E) : Colors.white,
                expandedFillColor:
                    vm.isDark() ? const Color(0xFF141A2E) : Colors.white,
              ),
              initialItem: vm.currentLanguage == "en" ? "English" : "عربى",
              items: languageList,
              onChanged: (value) {
                if (value == "English") {
                  vm.changeLanguage("en");
                } else if (value == "عربى") {
                  vm.changeLanguage("ar");
                }
              }),
          const SizedBox(height: 40),
          Text(
            lang.theme,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          CustomDropdown(
              initialItem: vm.isDark() ? "Dark" : "Light",
              decoration: CustomDropdownDecoration(
                expandedSuffixIcon: Icon(Icons.keyboard_arrow_up,
                    color:
                        vm.isDark() ? const Color(0xFFFACC10) : Colors.black),
                closedSuffixIcon: Icon(
                  Icons.keyboard_arrow_down,
                  color: vm.isDark() ? const Color(0xFFFACC10) : Colors.black,
                ),
                closedFillColor:
                    vm.isDark() ? const Color(0xFF141A2E) : Colors.white,
                expandedFillColor:
                    vm.isDark() ? const Color(0xFF141A2E) : Colors.white,
              ),
              items: themeList,
              onChanged: (value) {
                if (value == "Dark") {
                  vm.changeTheme(ThemeMode.dark);
                } else if (value == "Light") {
                  vm.changeTheme(ThemeMode.light);
                }
              })
        ],
      ),
    );
  }
}
