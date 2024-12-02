import 'package:chat_app/screens/chat_app.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:chat_app/widgets/custom_textFeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/customButton.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static String id = 'LoginScreen';


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String ?email;

  String ?password;

  GlobalKey<FormState>formkey=GlobalKey();
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff2B475E),
      ),
      backgroundColor: const Color(0xff2B475E),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0,),
                Image.asset('assets/images/scholar.png'),
                const Text(
                  'Scholar Chat',
                  style: TextStyle(
                      fontSize: 32.0, color: Colors.white, fontFamily: 'pacifico'),
                ),
                const SizedBox(
                  height: 100.0,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login Now',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                CustomTextFeild(
                  onChanged: (value)
                  {
                    email=value;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFeild(
                  onChanged: (value)
                  {
                    password=value;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomButton(
                  onTap: ()async
                  {
                    if(formkey.currentState!.validate())
                    {
                      try
                      {
                        isLoading=true;
                        setState(() {});
                        await loginUser();
                        Navigator.pushNamed(context, ChatPage.Id,arguments: email);

                      }on FirebaseAuthException catch(e)
                      {
                        if (e.code == 'user-not-found') {
                          showSnake(context,'No user found for that email.');//The password provided is too weak.
                        } else if (e.code == 'wrong-password') {
                          showSnake(context,'Wrong password provided for that user.');//The account already exists for that email
                        }

                      }

                    }else
                    {

                    }
                    isLoading=false;
                    setState(() {

                    });


                  },
                  buttonText: 'Login',

                ),
                const SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'dont have an account ?',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    GestureDetector(
                      onTap: ()
                      {
                        Navigator.pushNamed(context, 'RegisterScreen');
                      },
                      child: const Text(
                        '  Register now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnake(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            message
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!);
    print('login success');
  }
}
