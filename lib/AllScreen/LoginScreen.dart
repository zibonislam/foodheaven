import 'package:flutter/material.dart';
import 'package:foodheaven/AllScreen/RegistrationScreen.dart';

import 'homeScreen.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);

  static String idScreen = "login";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 173, 2, 33),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Image(
                  image: NetworkImage(
                      "https://media.licdn.com/dms/image/C5622AQHck53gmEkYhQ/feedshare-shrink_1280/0/1679069156443?e=1681948800&v=beta&t=72WDFfc7qCNRsGNjGMdMA4zgxXoOjY-0gmJD24TK878"),
                  width: 400.0,
                  height: 400.0,
                  alignment: Alignment.center,
                ),
              ),
              // SizedBox(
              //   height: 2.0,
              // ),
              Text(
                "Login For Existing User",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 198, 204),
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.0,
                    ),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle:
                            TextStyle(fontSize: 12.0, color: Colors.white),
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle:
                            TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ))),
                        child: Container(
                          height: 30.0,
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 229, 232, 229),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                           Navigator.pushNamedAndRemoveUntil(context,HomeScreen.idScreen, (route) =>  false);
                          print("User Email : " +
                              emailController.text +
                              " User Password : " +
                              passwordController.text);
                        }),
                    SizedBox(
                      height: 4.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.restorablePushNamedAndRemoveUntil(context,
                            RegistrationScreen.idScreen, (route) => false);
                        displayToastMessage("To Registration", context);
                      },
                      child: Text("Don't have an Acoount? Register"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
