import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/routes/app_routes.dart';
import 'package:redditum_flapp/app/ui/components/custom_color_type.dart';
import 'package:redditum_flapp/app/ui/components/button/command_button.dart';
import 'package:redditum_flapp/app/ui/components/textfield/input_text.dart';
import 'package:redditum_flapp/app/ui/components/textfield/label_text.dart';
import 'package:redditum_flapp/app/ui/components/textfield/link_text.dart';
import 'package:redditum_flapp/app/ui/views/login/login_controller.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Padding(
          padding: EdgeInsets.only(bottom: constraint.maxHeight * .1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: LabelText(
                  text: "Iniciar Sesi\u{00F3}n",
                  fontSize: 30.0,
                ),
              ),
              const Center(
                child:
                    LabelText(text: "Ingrese sus credenciales de acceso."),
              ),
              SizedBox(height: 10.w),
              const LabelText(text: "Usuario"),
              InputText(
                controller: controller.ctrlTextUsername,
                hintText: "Usuario",
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 10.w),
              const LabelText(text: "Contrase\u{00F1}a"),
              InputText(
                controller: controller.ctrlTextPassword,
                hintText: "Contrase\u{00F1}a",
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              LinkText(
                text: "¿Olvidaste tu contrase\u{00F1}a?",
                click: () => Get.toNamed(AppRoutes.forgotPassword),
              ),
              CommandButton(
                type: CustomColorType.primary,
                text: "Ingresar",
                click: controller.signIn,
              ),
              SizedBox(height: 20.w),
              const Divider(color: AppColors.whiteHint, height: 1.0),
              const Center(
                child: LinkText(
                  text: "Redditum v1.0.0",
                  color: AppColors.whiteHint,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
