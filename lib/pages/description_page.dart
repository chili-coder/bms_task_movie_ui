import 'package:bms_task/constants.dart';
import 'package:bms_task/widgets/coustome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionPage extends StatefulWidget {
   DescriptionPage({Key? key,this.title,this.image,this.rate,this.date,this.description}) : super(key: key);
  String? title;
  String? image;
  String? rate;
  String? date;
  String? description;
  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackroundColor,
      appBar: AppBar(
        title:  coustomeText(
          text: "Description",
          size: 24,
          color: Colors.deepOrange,
          fontWeight: FontWeight.w500,
        ),
        leading: InkWell(
          onTap: (){
            Get.back();
          },
            child: Icon(Icons.arrow_back,color: Colors.deepOrange,)),
        backgroundColor: Colors.black87,

      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(widget.image.toString(),
                        height: 200,
                        fit:BoxFit.cover,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            coustomeText(
                                text: widget.title,
                                size: 18,
                                maxLine: 8,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                            SizedBox(height: 5,),
                            coustomeText(
                                text: "Rate: "+"${widget.rate}",
                                size: 16,
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.w500),
                            SizedBox(height: 5,),
                            coustomeText(
                                text: widget.date,
                                size: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                      ),
                    ),
                    

                  
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/fbicon.png",width: 25,color: Colors.white,),
                        Image.asset("assets/images/instagram.png",width: 25,color: Colors.white,),
                        Image.asset("assets/images/twitter.png",width: 25,color: Colors.white,),
                        Image.asset("assets/images/shareicon.png",width: 25,color: Colors.white,)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text(widget.description.toString(),style: TextStyle(color: Colors.white,fontSize: 16,),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
