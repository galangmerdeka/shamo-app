// import 'package:flutter/cupertino.dart';

class FilterChipData {
  final String label;
  final bool isSelected;

  FilterChipData({
    required this.label,
    this.isSelected = false,
  });

  FilterChipData copy({
    String? label,
    bool? isSelected,
  }) =>
      FilterChipData(
        label: label ?? this.label,
        isSelected: isSelected ?? this.isSelected,
      );
}
