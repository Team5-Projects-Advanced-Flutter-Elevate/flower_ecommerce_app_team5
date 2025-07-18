import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatelessWidget {
  final String value;
  final void Function(String? value)? onChanged;
  final List<String> items;
  const CustomDropDownMenu(
      {super.key, required this.value, this.onChanged, required this.items});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value.isNotEmpty ? value : null,
      isExpanded: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item, overflow: TextOverflow.ellipsis),
              ))
          .toList(),
    );
  }
}
