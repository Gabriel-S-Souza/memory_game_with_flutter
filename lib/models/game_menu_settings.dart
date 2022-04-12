import 'package:flutter/material.dart';

class GameMenuSettings {
  final List<String> options;
  final List<IconData> icons;
  final String label;
  final void Function(String? selectedItem) onSelected;

  GameMenuSettings({
    required this.options,
    required this.icons,
    required this.label,
    required this.onSelected,
  });
}