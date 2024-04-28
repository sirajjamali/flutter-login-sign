// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, unused_field

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LoginState();
}

class _LoginState extends State<SignUp> {
  final _formfield = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  bool passToggle = true;
  bool newPassToggle = true;
  String _name = '';
  String _email = '';
  String _pass = '';
  String _newpass = '';
  String _phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 100),
                child: Text(
                  'Personal Details',
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
                  keyboardType: TextInputType.text,
                  controller: nameController,
                  onChanged: (value)=> setState(() {
                    print("Name: $_name");
                    _name = value;
                  }),
                  decoration: InputDecoration(
                    hintText: 'Name',
                    // prefixIcon: Icon(Icons.email),
                    // border: OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
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
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  onChanged: (value)=> setState(() {
                    print("Email: $_email");
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
                      return 'Please Correct Your Eamil';
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
                    print("Password: $_pass");
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
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (passController.text.length < 8) {
                      return 'Password Length Should be more then 8 characters';
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
                  controller: newPassController,
                  obscureText: newPassToggle,
                  onChanged: (value)=> setState(() {
                    print("New Password: $_newpass");
                    _newpass = value;
                  }),
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    hintText: 'New Password',
                    // prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          newPassToggle = !newPassToggle;
                        });
                      },
                      child: Icon(
                        newPassToggle ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    print("$_pass: $_newpass");
                    if (_pass != _newpass) {
                      return "Password doesn't match";
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
                  keyboardType: TextInputType.number,
                  controller: numberController,
                  onChanged: (value)=> setState(() {
                    print("Phone: $_phone");
                    _phone = value;
                  }),
                  decoration: InputDecoration(
                    hintText: 'Number',
                    // prefixIcon: Icon(Icons.email),
                    // border: OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone';
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

                          nameController.clear();
                          emailController.clear();
                          passController.clear();
                          newPassController.clear();
                          numberController.clear();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 1, 74, 116),
                      ),
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                      'By contiuning your confrim that you agree with\n                  Our Team and condition')),
                      SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 231, 231, 231)),
                    child:
                    Center(child: Image.asset('assets/google.png', height: 50,)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 231, 231, 231)),
                    child:
                    Center(child: Image.asset('assets/facebook.png', height: 43,)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 231, 231, 231)),
                    child:
                    Center(child: Image.asset('assets/twitter.png', height: 28,)),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
