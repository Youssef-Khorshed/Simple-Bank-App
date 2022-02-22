import 'package:flutter/material.dart';

Widget textformfield(
        {required TextEditingController controller,
        required IconData prefix_icon,
        IconData? suffix_icon,
        required TextInputType keyboard_type,
        bool password = false,
        String? text,
        String? hint,
        double radius = 0.0,
        FormFieldValidator<String>? validator,
        VoidCallback? suffix_hand,
        GestureTapCallback? ontap,
        InputBorder? inputborder,
        Function(String)? onchange,
        Function(String)? onsubmit,
        bool? enabled}) =>
    TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboard_type,
      obscureText: password,
      onTap: ontap,
      onFieldSubmitted: onsubmit,
      onChanged: onchange,
      enabled: enabled,
      style: TextStyle(fontSize: 15),
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        hintStyle: TextStyle(fontSize: 15),
        labelText: hint == null ? '$text' : null,
        hintText: text == null ? '$hint' : null,
        border: inputborder ?? inputborder,
        prefixIcon: IconButton(
          onPressed: suffix_hand,
          icon: Icon(prefix_icon),
        ),
        suffixIcon: IconButton(
          onPressed: suffix_hand,
          icon: Icon(suffix_icon),
        ),
      ),
    );
