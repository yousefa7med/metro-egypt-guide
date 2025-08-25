import 'package:flutter/material.dart';

class AppDropdownMenu extends StatelessWidget {
  const AppDropdownMenu({
    super.key,
    required this.controller,
    required this.hintText,
    required this.dropdownMenuEntry,
    this.onSelected,
  });
  final List<DropdownMenuEntry<dynamic>> dropdownMenuEntry;
  final TextEditingController controller;
  final String hintText;
  final void Function(dynamic)? onSelected;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onSelected: onSelected,
      menuHeight: 200,
      hintText: hintText,
      width: 370,
      controller: controller,
      enableSearch: true,
      requestFocusOnTap: true,
      enableFilter: true,
      dropdownMenuEntries: dropdownMenuEntry,
    );
  }
}
