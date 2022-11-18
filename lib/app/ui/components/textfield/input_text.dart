import 'package:flutter/material.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText,
    this.readOnly,
    this.onChanged,
  }) : super(key: key);

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? readOnly;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      textInputAction: TextInputAction.done,
      style: const TextStyle(
        fontSize: 16,
        fontFamily: "DroidSans",
        color: AppColors.bgWhite,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        hintStyle: const TextStyle(
          fontSize: 16,
          fontFamily: "DroidSans",
          color: AppColors.whiteHint,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
    );
  }
}
