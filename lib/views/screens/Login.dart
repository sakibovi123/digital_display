import 'package:digitaldisplay/views/screens/Home.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                  decoration: const InputDecoration(
                  icon: const Icon(Icons.email),
                  hintText: 'Enter a phone number',
                  labelText: 'Email',
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.password),
                      hintText: 'Enter password',
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(height:20.0),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> const Home())
                      );
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

                  )
                )
              ],
            ),
          ),





    ],
      ),
    );
  }
}
