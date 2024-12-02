import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/customButton.dart';
import '../widgets/custom_textFeild.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key});
  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String ?email;

  String ?password;

  GlobalKey<FormState>formkey=GlobalKey();

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                        'Register Now',
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
                        isLoading=true;
                        setState(() {});
                        try
                        {
                          await registerUser();

                        }on FirebaseAuthException catch(e)
                        {
                          if (e.code == 'weak-password') {
                            showSnake(context,'The password provided is too weak.');//The password provided is too weak.
                          } else if (e.code == 'email-already-in-use') {
                            showSnake(context,'The account already exists for that email');//The account already exists for that email
                          }
                        }
                      }
                      else {}
                      isLoading=false;
                      setState(() {

                      });

                    },
                    buttonText: 'Register',

                  ),
                   const SizedBox(height: 20.0,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'already have account ?',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      GestureDetector(
                        onTap: ()
                        {
                            Navigator.pop(context);
                        },
                        child: Text(
                          '  Login now',
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
      ),
    );;
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

  Future<void> registerUser() async {
    UserCredential user= await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!);
  }
}
