import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/ui/components/textfield/label_text.dart';
import 'package:redditum_flapp/app/ui/views/home/home_controller.dart';

class HomeContent extends GetView<HomeController> {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
      child: const SizedBox(
        width: double.infinity,
        child: LabelText(text: "Bienvenido al Sistema!"),
      ),
    );
  }
}
