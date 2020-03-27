import 'package:flutter/material.dart';

InputDecoration kSingInInputFeildsDecoration() => InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: 'Prename',
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(50), right: Radius.circular(50)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(50), right: Radius.circular(50)),
            
      ),
      errorText: null,
      errorBorder:OutlineInputBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(50), right: Radius.circular(50)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(50), right: Radius.circular(50)),
      ),
    );
