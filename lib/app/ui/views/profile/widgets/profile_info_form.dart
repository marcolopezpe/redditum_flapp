import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/ui/components/alerts/custom_message.dart';
import 'package:redditum_flapp/app/ui/components/custom_color_type.dart';
import 'package:redditum_flapp/app/ui/components/textfield/input_text.dart';
import 'package:redditum_flapp/app/ui/components/textfield/label_text.dart';
import 'package:redditum_flapp/app/ui/views/profile/profile_controller.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class ProfileInfoForm extends GetView<ProfileController> {
  const ProfileInfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const LabelText(
                  text: "Informaci\u{00F3}n Personal",
                  fontSize: 30,
                ),
                const LabelText(
                  text: "Datos personales del usuario autenticado.",
                  fontColor: AppColors.whiteHint,
                ),
                const LabelText(text: "Nombres"),
                InputText(
                  controller: controller.ctrlTextNombres,
                  readOnly: true,
                ),
                const LabelText(text: "Apellidos"),
                InputText(
                  controller: controller.ctrlTextApellidos,
                  readOnly: true,
                ),
                const LabelText(text: "Usuario"),
                InputText(
                  controller: controller.ctrlTextNombreUsuario,
                  readOnly: true,
                ),
                const LabelText(text: "E-mail"),
                InputText(
                  controller: controller.ctrlTextEmail,
                  readOnly: true,
                ),
                const SizedBox(height: 20),
                const Divider(color: AppColors.whiteHint, height: 1.0),
                const CustomMessage(
                  message:
                      "Si desea actualizar su informaci\u{00F3}n, contacte con el Administrador del Sistema.",
                  type: CustomColorType.primary,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
