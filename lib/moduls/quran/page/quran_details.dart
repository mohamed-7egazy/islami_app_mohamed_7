import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam_app_c10_sun_4pm/moduls/quran/page/quran_view.dart';

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

    // sync Vs async
    if (versesList.isEmpty) loadData(args.suraNumber);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/main_background.png",
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
              color: const Color(0XFFF8F8F8).withOpacity(0.8),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "سورة ${args.suraName}",
                    style: const TextStyle(
                      fontFamily: "El Messiri",
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.play_circle_filled_rounded,
                    size: 28,
                  ),
                ],
              ),
              Divider(
                color: theme.primaryColor,
              ),
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
                      style: const TextStyle(
                        fontFamily: "El Messiri",
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
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
