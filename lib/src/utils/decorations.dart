import 'package:flutter/material.dart';
import 'package:gl/src/utils/spacing.dart';

InputDecoration appInputDecoration({required String label}) => InputDecoration(
      filled: true,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(appRadius),
        ),
      ),
      fillColor: Colors.white,
      hintText: label,
    );

const appLabelText = TextStyle(fontWeight: FontWeight.bold);
const appLabelButton = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
const appTitleText = TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
