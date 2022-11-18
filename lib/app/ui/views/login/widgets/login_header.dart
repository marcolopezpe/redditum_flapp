import 'package:flutter/material.dart';
import 'package:redditum_flapp/app/ui/components/logos/custom_logo.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: CustomLogo(),
    );
  }
}