import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String value;

  const CustomText({Key key, this.text, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$text',
        style: TextStyle(color: Colors.black54,),
        children: [
          TextSpan(
            text: '$value.',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}