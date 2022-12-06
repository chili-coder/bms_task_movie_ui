import 'package:bms_task/constants.dart';
import 'package:bms_task/model/item_model.dart';
import 'package:bms_task/pages/description_page.dart';
import 'package:bms_task/pages/login_page.dart';
import 'package:bms_task/widgets/coustome_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key,this.title,this.image,this.rate,this.date,this.description}) : super(key: key);
   String? title;
   String? image;
   String? rate;
   String? date;
   String? description;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
    Get.to(LoginPage());
  }




  @override
  Widget build(BuildContext context) {
    final grid = itemModel.list();
    return Scaffold(
      backgroundColor: kBackroundColor,
      appBar: AppBar(
        title:  coustomeText(
          text: "Home",
          size: 24,
          color: Colors.deepOrange,
          fontWeight: FontWeight.w500,
        ),
        leading: Icon(Icons.menu,color: Colors.deepOrange,),
        backgroundColor: Colors.black87,
        actions: [
          InkWell(
            onTap: (){
              logout();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 16,right: 16),
              child: coustomeText(
                text: "Logout",
                size: 18,
                color: Colors.yellowAccent,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],

      ),

      body: GridView.builder(
          itemCount: grid.length,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 256,
          ),
          itemBuilder: (_,index){
            return  Container(

              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Container(
                  color: Colors.black,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DescriptionPage(
                              title:"${grid[index].title}",
                              image:"${grid[index].image}",
                              rate:"${grid[index].rate}",
                              date:"${grid[index].date}",
                              description:"${grid[index].description}",

                            ),
                          ));

                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                            child: Image.asset("${grid[index].image}",
                                height: 180,
                                fit:BoxFit.cover
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            children: [
                              coustomeText(
                                  text: "${grid[index].title}",
                                  size: 12,
                                  maxLine: 2,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  coustomeText(
                                      text: "${grid[index].rate}",
                                      size: 12,
                                      maxLine: 1,
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.w500),
                                  coustomeText(
                                      text: "${grid[index].date}",
                                      size: 10,
                                      maxLine: 1,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w500),
                                ],
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          }

      ),



      );

  }
}
