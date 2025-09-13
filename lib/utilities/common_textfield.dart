import 'package:flutter/material.dart';

class CustomizedTextFieldGreyBg extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType? keyboardType;
  final double? height; // optional height

  const CustomizedTextFieldGreyBg({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
    this.validator,
    this.hintText = "",
    this.keyboardType,
    this.height, // added
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textField = TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: Colors.black,
      focusNode: focusNode,
      onFieldSubmitted: (val) {
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        } else {
          focusNode.unfocus();
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: height == null
            ? const EdgeInsets.symmetric(vertical: 18, horizontal: 16) // default
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 0), // balance text inside

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
    );

    // Wrap only if height is given
    if (height != null) {
      return SizedBox(height: height, child: textField);
    } else {
      return textField;
    }
  }
}

class CustomPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueNotifier<bool> isPasswordVisibleNotifier;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;
  final String hintText;

  const CustomPasswordField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.isPasswordVisibleNotifier,
    this.validator,
    this.onSubmitted,
    this.hintText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isPasswordVisibleNotifier,
      builder: (context, isPasswordVisible, child) {
        return TextFormField(
          controller: controller,
          cursorColor: Colors.black,
          focusNode: focusNode,
          obscureText: !isPasswordVisible,
          validator: validator,
          onFieldSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
              onPressed: () {
                isPasswordVisibleNotifier.value = !isPasswordVisible;
              },
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 0.5), // use `primaryColor` if available
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}

