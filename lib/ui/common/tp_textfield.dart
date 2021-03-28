
import 'package:flutter/material.dart';

class TPTextField extends StatelessWidget {
  TPTextField({this.title, this.placeholder, this.obscureText = false, this.controller, this.stream});
  final String title;
  final String placeholder;
  final bool obscureText;
  final TextEditingController controller;
  final Stream stream;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            return TextField(
              controller: this.controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: TextStyle(
                  // color: TPColors.cloud
                ),
                errorText: snapshot.hasError ? snapshot.error : null,

              ),
            );
          }
        ),
      ],
    );
  }
}