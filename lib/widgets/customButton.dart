import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({required this.onTap,required this.buttonText,});
String?buttonText;
 VoidCallback?onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        width: double.infinity,
        child: MaterialButton(
          onPressed: onTap,
          child:  Text(
            buttonText!,
            style: TextStyle(fontSize: 20.0, color: Colors.black),
          ),
        ));
  }
}
