import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormWidget extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final int maxline;
  const TextFormWidget({
    Key? key,
    required this.prefixIcon,
    required this.hintText,
    this.keyboardType = TextInputType.name,
    required this.controller,
    this.inputFormatters,
    this.maxline = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      // textAlign: TextAlign.center,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        // hintText: hintText,
        label: Text(hintText),

        // errorText: 'Invalid',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      // validator: validator,
      inputFormatters: inputFormatters,
      validator: (value) {
        if (value == null) {
          return 'Field Cannot be Empty';
        }
      },
    );
  }
}
