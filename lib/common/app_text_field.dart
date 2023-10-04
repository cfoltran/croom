import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.onChanged,
    this.labelText,
    this.hintText,
    this.formKey,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.errorText,
    this.onEditingComplete,
    this.focusNode,
    this.maxLength,
    this.nextFocusNode,
    this.inputFormatters,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final TextInputType keyboardType;
  final Key? formKey;
  final bool obscureText;
  final TextInputAction textInputAction;
  final String? errorText;
  final void Function(String) onChanged;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final bool autofocus;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: formKey,
      onChanged: onChanged,
      autofocus: autofocus,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.grey[400]!,
            width: 1.0,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
      ),
    );
  }
}
