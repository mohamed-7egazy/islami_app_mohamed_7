import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam_app_c10_sun_4pm/config/settings_provider.dart';
import 'package:islam_app_c10_sun_4pm/moduls/quran/page/quran_view.dart';
import 'package:provider/provider.dart';

class QuranDetailsView extends StatefulWidget {
  static const String routeName = "quran_details";

  const QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetial;
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<settingProvider>(context);

    // sync Vs async
    if (versesList.isEmpty) loadData(args.suraNumber);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            vm.getBackground(),
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("إسلامي"),
        ),
        body: Container(
          width: mediaQuery.width,
          height: mediaQuery.height,
          margin: const EdgeInsets.only(
            right: 20,
            left: 20,
            top: 15,
            bottom: 80,
          ),
          padding: const EdgeInsets.only(
            right: 20,
            left: 20,
            top: 15,
            bottom: 15,
          ),
          decoration: BoxDecoration(
              color: vm.isDark()
                  ? const Color(0xFF141A2E).withOpacity(0.8)
                  : const Color(0XFFF8F8F8).withOpacity(0.8),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("سورة ${args.suraName}",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: vm.isDark()
                            ? const Color(0xFFFACC10)
                            : Colors.black,
                      )),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.play_circle_filled_rounded,
                    size: 28,
                    color: vm.isDark() ? const Color(0xFFFACC10) : Colors.black,
                  ),
                ],
              ),
              const Divider(),
              if (versesList.isEmpty)
                Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryColor,
                  ),
                ),
              if (versesList.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Text(
                      "{${index + 1}} ${versesList[index]}",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: vm.isDark()
                            ? const Color(0xFFFACC10)
                            : Colors.black,
                      ),
                    ),
                    itemCount: versesList.length,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadData(String suraNumber) async {
    String suraContent =
        await rootBundle.loadString("assets/files/$suraNumber.txt");
    versesList = suraContent.split("\n");
    setState(() {});
  }
}
