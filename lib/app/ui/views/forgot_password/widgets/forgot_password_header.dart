import 'package:flutter/material.dart';
import 'package:redditum_flapp/app/ui/components/logos/custom_logo.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgSidebar,
      child: AspectRatio(
        aspectRatio: 16.0 / 9.0,
        child: ClipPath(
          clipper: _CustomClipper(),
          child: Container(
            color: AppColors.bgCard,
            child: const CustomLogo(),
          ),
        ),
      ),
    );
  }
}


class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    var firstStart = Offset(0, size.height);
    var firstEnd = Offset(0, size.height - 1);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 2.5), size.height - 50);
    var secondEnd = Offset(size.width, size.height - 1);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
