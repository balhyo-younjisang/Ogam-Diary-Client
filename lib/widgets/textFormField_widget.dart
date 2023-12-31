import 'package:flutter/material.dart';
// import 'package:ogam_diary/utils/hexColor.dart';

class TextFormFieldWidget {
  Widget renderTextFormField(
      {required String label,
      required FormFieldSetter onSaved,
      required FormFieldValidator validator,
      bool? isPassword,
      TextInputType? keyboardType}) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontFamily: "Gugi-Regular"),
          errorStyle: const TextStyle(fontFamily: "Gugi-Regular")),
      onSaved: onSaved,
      validator: validator,
      obscureText: isPassword != null ? true : false,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction, //자동으로 validation
    );
  }
}
