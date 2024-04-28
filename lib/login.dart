// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:login_sign/sign-up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formfield = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool passToggle = true;

  String _email = '';
  String _pass = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formfield,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 100),
                child: Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  onSaved: (value) {
                    print('value $value');
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  onChanged: (value)=> setState(() {
                    _email = value;
                  }),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    // prefixIcon: Icon(Icons.email),
                    // border: OutlineInputBorder()
                  ),
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!emailValid) {
                      return 'Please correct your Eamil';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  onSaved: (value) {
                    print('value $value');
                  },
                  keyboardType: TextInputType.visiblePassword,
                  controller: passController,
                  obscureText: passToggle,
                  onChanged: (value)=> setState(() {
                    _pass = value;
                  }),
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    hintText: 'Password',
                    // prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                        passToggle ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    } else if (passController.text.length < 8) {
                      return 'Password Length Should be more then 8 characters';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: 700,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formfield.currentState!.validate()) {
                          print('success');
                          emailController.clear();
                          passController.clear();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 1, 74, 116),
                      ),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Forget your password',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      // backgroundColor: Color.pink,
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue, width: 3)))),
                  child: Center(
                    child: Text(
                      'LOGIN WITH FACEBOOK',
                      style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 33, 149, 243)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dno't have an account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
