// import 'package:flutter/cupertino.dart';

class ChoiceChipsData {
  final String label;
  final bool isSelected;

  ChoiceChipsData({
    required this.label,
    required this.isSelected,
  });

  ChoiceChipsData copy({
    String? label,
    bool? isSelected,
  }) =>
      ChoiceChipsData(
        label: label ?? this.label,
        isSelected: isSelected ?? this.isSelected,
      );
}
