import 'package:bms_task/pages/home_page.dart';
import 'package:bms_task/widgets/coustome_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      if (reslut == null) {
        return;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
      await FirebaseAuth.instance.signInWithCredential(credential);
      print("Result $reslut");
      print(reslut.displayName);
      print(reslut.email);
      print(reslut.photoUrl);
      Get.to(HomePage());

    } catch (error) {
      print(error);
    }
  }
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
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
        backgroundColor: Colors.black38,
       body: Container(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16),
           child: Column(
             children: [
               Expanded(flex:2,child: Center(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [

                     Column(
                      children: [
                        coustomeText(
                            text: "Hello!",
                            size: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                        coustomeText(
                            text: "Movie Lover",
                            size: 18,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w400),
                        SizedBox(height: 20,),
                        coustomeText(
                            text: "Please, LOGIN",
                            size: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),


                      ],
                    ),
                   ],

                 ),
               )),

               Expanded( flex: 1,
                 child: Padding(
                   padding: EdgeInsets.symmetric(horizontal: 60),
                   child: Container(
                     child: Column(
                       children: [
                         OutlinedButton(
                           onPressed: (){
                          //Get.to(HomePage());
                             googleLogin();
                           },
                           style: OutlinedButton.styleFrom(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(50),
                             ),
                             side: BorderSide(width: 2, color: Colors.deepOrange),
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(6),
                             child: Row(
                               children: [
                                 Image.asset("assets/images/google.png",height: 35,width: 30,color: Colors.deepOrange,),
                                 Expanded(
                                   child: Center(
                                     child: coustomeText(
                                       text: "Google",
                                       size: 24,
                                       color: Colors.white,
                                       fontWeight: FontWeight.w300,

                                     ),
                                   ),
                                 )
                               ],),
                           ),

                         ),
                         SizedBox(height: 20,),
                         OutlinedButton(
                           onPressed: () async{
                              await signInWithFacebook();
                            // Get.to(HomePage());
                           },
                           style: OutlinedButton.styleFrom(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(50),
                             ),
                             side: BorderSide(width: 2, color: Colors.deepOrange),
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(6),
                             child: Row(
                               children: [
                               Image.asset("assets/images/facebook.png",height: 35,width: 30,color: Colors.deepOrange,),
                               Expanded(
                                 child: Center(
                                   child: coustomeText(
                                     text: "Facebook",
                                     size: 24,
                                     color: Colors.white,
                                     fontWeight: FontWeight.w300,

                                   ),
                                 ),
                               )
                             ],),
                           ),

                         ),
                       ],
                     ),
                   ),
                 ),
               )

             ],
           ),
         ),
       )



      ),
    );
  }
}
