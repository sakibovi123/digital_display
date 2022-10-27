import 'package:digitaldisplay/controllers/UserController.dart';
import 'package:digitaldisplay/views/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = "";
  String _password = "";

  final _form = GlobalKey<FormState>();

  void _login() async {
    var isvalid = _form.currentState!.validate();
    if (!isvalid) {
      return;
    }
    _form.currentState!.save();
    bool token = await Provider.of<UserController>(context, listen: false)
        .loginNow(_email, _password);
    if (token) {
      Navigator.of(context).pushReplacementNamed(Home.routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Something went wrong please try again!"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe9e9ff),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/avatarlogin.png",
              height: 200.0,
            ),
          ),
          Form(
            key: _form,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Enter and valid email";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) => {_email = value as String},
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.email),
                      hintText: 'Enter Email',
                      labelText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (e) {
                      if (e!.isEmpty) {
                        return 'Enter Password..';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _password = value as String;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.password),
                      hintText: 'Enter password',
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                    onPressed: () {
                      _login();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF111111),
                      padding: EdgeInsets.all(10.0),
                      minimumSize: Size(120, 40),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
