import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islam_app_c10_sun_4pm/config/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  List<String> languagesList = [
    "ُEnglish",
    "عربى",
  ];
  List<String> themeList = [
    "ُDark",
    "Light",
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var local = AppLocalizations.of(context)!;
    var vm = Provider.of<SettingsProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            local.language,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          CustomDropdown<String>(
            items: languagesList,
            // initialItem: vm.currentLanguage == "en" ? "English" : "عربى",
            onChanged: (value) {
              if (value == "English") {
                vm.changeLanguage("en");
              } else if (value == "عربى") {
                vm.changeLanguage("ar");
              }
            },
          ),
          const SizedBox(height: 40),
          Text(
            local.theme,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          CustomDropdown<String>(
            items: themeList,
            onChanged: (value) {
              if (value == "Dark") {
                vm.changeTheme(ThemeMode.dark);
              } else if (value == "Light") {
                vm.changeTheme(ThemeMode.light);
              }
              print(value);
            },
          ),
        ],
      ),
    );
  }
}
