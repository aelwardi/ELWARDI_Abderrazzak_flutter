import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  late final Function onPressed;
  late final String name;
  MyButton({required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onPressed;
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xff746bc9)),
        ),
        child: Text(
            name,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
