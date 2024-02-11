import 'package:flutter/material.dart';

class TasbehView extends StatefulWidget {
  const TasbehView({Key? key}) : super(key: key);

  @override
  _TasbehViewState createState() => _TasbehViewState();
}

class _TasbehViewState extends State<TasbehView> {
  int counter = 0;
  String switchText = "سبحان الله";

  void updateSwitchText() {
    if (counter % 33 == 0) {
      switch (switchText) {
        case "سبحان الله":
          switchText = "الحمد لله";
          break;
        case "الحمد لله":
          switchText = "الله أكبر";
          break;
        case "الله أكبر":
          switchText = "سبحان الله";
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30, left: 40),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 105,
                  width: 73,
                  child: Image.asset(
                    "assets/images/head_of_seb7a.png",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 79, right: 35),
                  height: 234,
                  width: 232,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                        updateSwitchText();
                        if (counter % 33 == 0) {
                          counter = 0;
                        }
                      });
                    },
                    child: Transform.rotate(
                      angle: (counter % 33) * 8 * 0.0174533,
                      child: Image.asset("assets/images/body_of_seb7a.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            "عدد التسبيحات",
            style: TextStyle(
              fontFamily: "El Messiri",
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          GestureDetector(
            child: Container(
              height: 154,
              width: 137,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 69,
                    height: 81,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFFc9b495),
                    ),
                    child: Text(
                      counter.toString(),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    width: 137,
                    height: 51,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xFFB7935F),
                    ),
                    child: Text(
                      "$switchText",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "El Messiri",
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
