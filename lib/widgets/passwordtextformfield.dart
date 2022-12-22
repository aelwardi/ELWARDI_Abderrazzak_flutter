import 'package:flutter/material.dart';
class PasswordTextFormField extends StatelessWidget {
  late final bool obserText;
  late final Function validator;
  late final Function onTap;
  late final String name;

  PasswordTextFormField({
    required this.name,
    required this.validator,
    required this.obserText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obserText,
      validator: (value){
        if(value == "" ){
          return "Please Fill Password";
        }
        else if(value!.length < 8){
          return "Password Is Too short";
        }
        return "";
      },
      decoration: InputDecoration(
        hintText: "Password",
        suffixIcon: GestureDetector(
          onTap: (){
            obserText = !obserText;
            FocusScope.of(context).unfocus();
          },
          child: Icon(
            obserText == true? Icons.visibility: Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}
