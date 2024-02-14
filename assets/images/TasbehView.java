
import 'package:flutter/material.dart';

class TasbehView extends StatefulWidget {
  const TasbehView({super.key});

  @override
  State<TasbehView> createState() => _TasbehViewState();
}

class _TasbehViewState extends State<TasbehView> {
  double routationAngel = 0.0;
  int counter = 0;
  int maxValue =33;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return  Center(
      child: Column(
        children: [
          SizedBox(height: 70),
          Image.asset('assets/images/head of seb7a.png',
              height: mediaQuery.height * 0.1),
          GestureDetector(
            onTap: (){
              setState(() {
                routationAngel += 45.0;
                if (counter<maxValue) {
                  counter++;
                }else{
                  counter =0;
                }
              });
            },
            child: Transform.rotate(angle: routationAngel *(3.14/80),
            child:Image.asset('assets/images/body of seb7a.png',
                height: mediaQuery.height * 0.2),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "عدد التسبيحات",
            style: TextStyle(
                fontFamily: "El Messiri",
                fontSize: 25,
                fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),
          ClipOval(
            child: Container(

              color: theme.primaryColor,
              padding: EdgeInsets.all(16.0),
              child: Text('$counter',
              style: TextStyle(color: Colors.black),),

            ),
          ),
          SizedBox(height: 20),
          Container(

              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(50)),
              child: const Center(
                child: Text(
                  'سبحان الله',
                  style: TextStyle(color: Colors.white, fontFamily: "El Messiri",
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
