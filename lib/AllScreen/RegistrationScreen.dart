import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodheaven/AllScreen/LoginScreen.dart';

class RegistrationScreen extends StatelessWidget {
  // const RegistrationScreen({Key? key}) : super(key: key);
  static String idScreen = "register";

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 173, 2, 33),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Image(
                  image: NetworkImage(
                      "https://media.licdn.com/dms/image/C5622AQHck53gmEkYhQ/feedshare-shrink_1280/0/1679069156443?e=1681948800&v=beta&t=72WDFfc7qCNRsGNjGMdMA4zgxXoOjY-0gmJD24TK878"),
                  width: 400.0,
                  height: 200.0,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Text(
                "Registration For New User ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 206, 177)),
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
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "First Name",
                        labelStyle:
                            TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    TextField(
                      controller: lastNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        labelStyle:
                            TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),
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
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: " Confirm Password",
                        labelStyle:
                            TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ))),
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 229, 232, 229),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          print("First Name :" +
                              firstNameController.text +
                              "Last Name :" +
                              lastNameController.text +
                              "User Email : " +
                              emailController.text +
                              " User Password : " +
                              passwordController.text +
                              "Confirm Password :" +
                              confirmPasswordController.text);

                          displayToastMessage(
                              "Registration successfull", context);
                        }),
                    SizedBox(
                      height: 4.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.restorablePushNamedAndRemoveUntil(
                            context, LoginScreen.idScreen, (route) => false);
                      },
                      child: Text("Back To Login"),
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

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
