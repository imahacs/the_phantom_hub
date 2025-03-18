import 'package:flutter/material.dart';

class AuthDropdown extends StatelessWidget {
  final String label;
  final String hintText;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;
  final String? Function(String?)? validator;

  const AuthDropdown({
    super.key,
    required this.label,
    required this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        DropdownButtonFormField<String>(
          value: value,
          hint: Text(hintText),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          validator: validator ??
              (value) => value == null ? "Please select $label" : null,
          decoration: const InputDecoration(),
        ),
      ],
    );
  }
}
