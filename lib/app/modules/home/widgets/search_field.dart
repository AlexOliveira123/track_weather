import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../home_controller.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeController>();
    return TextFormField(
      style: TextStyle(
        color: Colors.grey[600],
        fontWeight: FontWeight.bold,
      ),
      onChanged: controller.onChangedSearch,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[400],
            style: BorderStyle.solid,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[400],
            style: BorderStyle.solid,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        labelText: 'Search a city, Ex: London, UK',
        labelStyle: TextStyle(
          color: Colors.grey[500],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
