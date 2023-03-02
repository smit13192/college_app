import 'package:flutter/material.dart';

import '../../model/gender.dart';

class MyRadioTile extends StatelessWidget {
  final Gender value;
  final Gender groupValue;
  final String text;
  final Function(Gender? changedValue) onChanged;

  const MyRadioTile({
    required this.value,
    required this.groupValue,
    required this.text,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      tileColor: groupValue == value ? Colors.blueGrey : Colors.grey[50],
      activeColor: Colors.white,
      value: value,
      title: Text(
        text,
        style: TextStyle(
          color: groupValue == value ? Colors.white : Colors.black,
        ),
      ),
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
