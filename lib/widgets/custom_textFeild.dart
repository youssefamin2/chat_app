import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
   CustomTextFeild({super.key, required this.hintText,required this.onChanged});
   String ?hintText;
   Function(String)?onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value)
      {
        if(value!.isEmpty)
        {
          return'feild is required';

        }
      },
      onChanged:onChanged ,
      decoration: InputDecoration(
        hintText:hintText ,
        hintStyle: const TextStyle(
          color: Colors.white
        ),
        focusedBorder:const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white
            )
        ) ,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white
            )
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white
            )
        ),
      ),

    );
  }
}
