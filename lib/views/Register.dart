import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/views/Login.dart';
import 'package:flutter_application_1/views/Widgets/fields.dart';
import 'package:flutter_application_1/views/Widgets/texxt_button.dart';
import 'package:flutter_application_1/views/theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/user.api.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();

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
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Image(
                          height: 100,
                          width: 100,
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
                                fontSize: 20,
                                fontFamily: 'Rubik Medium',
                                color: Color(0xff203142)),
                          ),
                        
                        ],
                      )
                    ],
                  ),
          SizedBox(
            height: 5,
          ),
          const Center(child:Column(
      children: [
        Text(
          "Welcome ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
        ),
        Text("Create your account",
        style: TextStyle(color: Colors.black),)
      ],
    ),
                  ), 
const SizedBox(height: 20),
          TextField(
            controller: firstNameController,
                      decoration: InputDecoration(
                          hintText: "First name",
                          fillColor: Color.fromARGB(255, 220, 228, 220),
                          filled: true,
                          prefixIcon: const Icon(Icons.person,color: Color(0xff323f4b),),
                          focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe4e7eb)),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe4e7eb)),
                borderRadius: BorderRadius.circular(10),
              ),
                    ),),
      const SizedBox(height: 10),
      TextField(
            controller: lastNameController,
                      decoration: InputDecoration(
                          hintText: "First name",
                          fillColor: Color.fromARGB(255, 220, 228, 220),
                          filled: true,
                          prefixIcon: const Icon(Icons.person,color: Color(0xff323f4b),),
                          focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe4e7eb)),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe4e7eb)),
                borderRadius: BorderRadius.circular(10),
              ),
                    ),),
      const SizedBox(height: 10),
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
      const SizedBox(height: 10),
            TextField(
                controller: phoneController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 10,
                      decoration: InputDecoration(
                          hintText: "Phone",
                          fillColor: Color.fromARGB(255, 220, 228, 220),
                          filled: true,
                          prefixIcon: const Icon(Icons.phone,color: Color(0xff323f4b),),
                          focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe4e7eb)),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe4e7eb)),
                borderRadius: BorderRadius.circular(10),
              ),
                    ),),
      const SizedBox(height: 10),
           TextField(
                controller: genderController,
                maxLength: 1,
                      decoration: InputDecoration(
                          hintText: "Gender",
                          fillColor: Color.fromARGB(255, 220, 228, 220),
                          filled: true,
                          prefixIcon: const Icon(Icons.man,color: Color(0xff323f4b),),
                          focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe4e7eb)),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe4e7eb)),
                borderRadius: BorderRadius.circular(10),
              ),
                    ),),
      const SizedBox(height: 10),
          TextFormField(
            controller: passwordController,
            obscureText: true, 
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
      const SizedBox(height: 10),
              TextField(
                      controller: countryController,
                      decoration: InputDecoration(
                          hintText: "Country",
                          fillColor: Color.fromARGB(255, 220, 228, 220),
                          filled: true,
                          prefixIcon: const Icon(Icons.location_on,color: Color(0xff323f4b),),
                          focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe4e7eb)),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe4e7eb)),
                borderRadius: BorderRadius.circular(10),
              ),
                    ),),
          CustomTextButton(
            title: 'Register',
            margin: EdgeInsets.only(top: 50),
            onTap: () {
    // Create a User object with the provided input values
    User user = User(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
      gender: genderController.text,
      phone: phoneController.text,
      country: countryController.text,
    );

    // Call the register function with the User object
    registerUser(user);
  },
          ),
          Container(
            margin: EdgeInsets.only(
              top: 40,
              bottom: 74,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an Account ? ",style: TextStyle(color: Colors.black),),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  },
                  child: Text(
                    "Login",
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
