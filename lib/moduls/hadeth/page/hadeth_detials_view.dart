import 'package:flutter/material.dart';
import 'package:islam_app_c10_sun_4pm/config/settings_provider.dart';
import 'package:islam_app_c10_sun_4pm/moduls/hadeth/page/hadeth_view.dart';
import 'package:provider/provider.dart';

class HadethDetailsView extends StatelessWidget {
  static const String routeName = "hadethDetails";

  const HadethDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethData;
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<settingProvider>(context);

    // sync Vs async

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
              Text(args.title,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: vm.isDark() ? const Color(0xFFFACC10) : Colors.black,
                  )),
              const Divider(),
              Text(args.content,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: vm.isDark() ? const Color(0xFFFACC10) : Colors.black,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
