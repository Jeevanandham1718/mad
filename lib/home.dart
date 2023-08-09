import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void form() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(formKey.currentContext!).showSnackBar(SnackBar(
        content: Text("Successfull"),
        backgroundColor: Colors.green,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo.png",
                width: 300,
                height: 230,
              ),
              Container(
                margin: EdgeInsets.only(top: 0),
                child: Text(
                  "Please login to continue our app",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2)),
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter username';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 350,
                child: TextFormField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.remove_red_eye_rounded,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2)),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter Password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 280),
                child: TextButton(
                    onPressed: () {
                      email.clear();
                      password.clear();
                    },
                    child: Text(
                      "Reset",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    )),
              ),
              InkWell(
                onTap: () {
                  form();
                },
                child: Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(color: Colors.deepOrangeAccent),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
