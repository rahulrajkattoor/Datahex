import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController EmailController=TextEditingController();
  final TextEditingController PasswordController=TextEditingController();
  String? _userInfo;

 Future<void>login()async{
   final email=EmailController.text;
   final password=PasswordController.text;
   
   final response=await http.post(Uri.parse("https://online-entrance-test-api-umxbq.ondigitalocean.app/api/v1/auth/login."),
   headers: {'Content-Type':'application/json'},
   body: jsonDecode({'email':email,'password':password} as String));

   if(response.statusCode==200){
     final data=jsonDecode(response.body);
     setState(() {
       _userInfo='Full Name:${data["user"]['fullname']}\n'
           'Email:${data["user"]["email"]}\n'
           'Role:${data["user"]["userType"]["roleDisplayName"]}';
     });
   }else{
     setState(() {
       _userInfo='Login failde:${response.statusCode}';
     });
   }

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.tealAccent,
            child: SizedBox(
                height: 300,

                child: Center(child: Padding(padding: EdgeInsets.only(top: 20),
                    child: Image(image: AssetImage("assets/Young Man with Phone copy 1.png"))))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 30,top: 50),
                      child: Text("Sign in",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text("Please enter the details\n"
                          "below to continue"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50,
                      left: 30,right: 30),
                      child: TextField(
                        controller: EmailController,
                        decoration: InputDecoration(
                          hintText: "Email ID",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),


                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30,
                          left: 30,right: 30),
                      child: TextField(
                        controller: PasswordController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            )
                        ),


                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10,left: 42),
                      child: SizedBox(
                        width: 400,
                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(backgroundColor: Colors.tealAccent,),
                            onPressed: login, child: Text("Signin",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40,
                      top: 40),
                      child: Text("Dont have an account ?"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 190,),
                      child: TextButton(

                          onPressed: (){}, child: Text("Signup",style: TextStyle(color: Colors.blue),)),
                    )

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
