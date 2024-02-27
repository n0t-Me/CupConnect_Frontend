import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/views/home.dart';

import 'package:flutter_application_1/models/user.api.dart';
import '../models/user_cubit.dart';
import 'package:flutter_application_1/views/Widgets/fields.dart';
import 'package:flutter_application_1/views/Widgets/image_button.dart';
import 'package:flutter_application_1/views/Widgets/texxt_button.dart';
import 'Register.dart';
import 'ForgetPass.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
           const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Image(
                          height: 150,
                          width: 150,
                          image: AssetImage('lib/assets/logo2.png')),
                       SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            "CupConnect",
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Rubik Medium',
                                color: Color(0xff203142)),
                          ),
                        
                        ],
                      )
                    ],
                  ),
          const SizedBox(
                    height: 40,
                  ),
                  const Center(child:Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.black),
        ),
        Text("Enter your credential to login",
        style: TextStyle(color: Colors.black),)
      ],
    ),
                  ),  
          
          const SizedBox(
            height: 100,
          ),
          
                    TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Email',
              fillColor: Color.fromARGB(255, 220, 228, 220),
              filled: true,
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xff323f4b),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe4e7eb)),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe4e7eb)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20), // Adjust as needed
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: 'Password',
              fillColor: Color.fromARGB(255, 220, 228, 220),
              filled: true,
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xff323f4b),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe4e7eb)),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe4e7eb)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPassPage()),
                  );
                },
                child: Text(
                  "I Forgot my Password !!",
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
          ),
          // Login
          CustomTextButton(
            onTap: () async {
              var authRes =
                  await userAuth(emailController.text, passwordController.text);
                      print('Authentication result: $authRes'); // Add this line

              if (authRes.runtimeType == String) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Container(
                          alignment: Alignment.center,
                          height: 200,
                          width: 250,
                          decoration: BoxDecoration(),
                          child: Text(authRes)),
                    );
                  },
                );
              } else if (authRes.runtimeType == User) {
                      print('User authenticated successfully'); // Add this line
                User user = authRes;
                context.read<UserCubit>().setUser(user);
                Navigator.of(context).pushReplacement( // Use pushReplacement to replace current route with HomePage
        MaterialPageRoute(
          builder:(context) => HomePage(),
                ));
              }
            },
            title: 'Login',
            margin: EdgeInsets.only(top: 50),
          ),
          //
          Container(
            margin: EdgeInsets.only(
              top: 30,
              bottom: 74,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Dont have an account? ",style: TextStyle(color: Colors.black),),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    "Signup ! ",
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                      color: Color.fromRGBO(101, 150, 137, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
