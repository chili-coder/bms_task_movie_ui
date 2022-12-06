import 'dart:async';

import 'package:bms_task/pages/login_page.dart';
import 'package:bms_task/widgets/coustome_text.dart';
import 'package:flutter/material.dart';

class WcPage extends StatefulWidget {
  const WcPage({Key? key}) : super(key: key);

  @override
  State<WcPage> createState() => _WcPageState();
}

class _WcPageState extends State<WcPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>LoginPage(),),);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/backround.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
               body:  Column(
                 children: [
                   Expanded(
                     child: Center(
                       child: Padding(
                         padding: const EdgeInsets.all(80),
                          child: coustomeText(
                           text: "Welcome!",
                           size: 30,
                           color: Colors.white,
                           fontWeight: FontWeight.w600,
                         )
                       ),
                     ),
                   ),

                   TweenAnimationBuilder<double>(
                     tween: Tween<double>(begin: 0.0, end: 1),
                     duration: const Duration(milliseconds: 2700),
                     builder: (context, value, _) => CircularProgressIndicator(value: value),
                   ),

                   SizedBox(height: 20,),
                   coustomeText(
                     text: "BMS Task",
                     size: 14,
                     color: Colors.white,
                     fontWeight: FontWeight.w600,
                   ),
                   coustomeText(
                     text: "sohagh.swe@gmail.com",
                     size: 12,
                     color: Colors.white,
                     fontWeight: FontWeight.w600,
                   ),
                   SizedBox(height: 15,)
                 ],
               )

      ),
    );


  }
}
