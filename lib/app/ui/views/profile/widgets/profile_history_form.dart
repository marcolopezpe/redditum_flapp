import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:redditum_flapp/app/ui/components/button/command_button.dart';
import 'package:redditum_flapp/app/ui/components/custom_color_type.dart';
import 'package:redditum_flapp/app/ui/components/textfield/label_text.dart';
import 'package:redditum_flapp/app/ui/views/profile/profile_controller.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class ProfileHistoryForm extends GetView<ProfileController> {
  const ProfileHistoryForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: LabelText(
                    text: "Historial de Sesiones",
                    fontSize: 30,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: LabelText(
                    text: "Listado de historial de sesiones del usuario.",
                    fontColor: AppColors.whiteHint,
                  ),
                ),
                SliverToBoxAdapter(
                  child: CommandButton(
                    text: "Actualizar Datos",
                    type: CustomColorType.success,
                    click: controller.refreshSesiones,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                    bottom: kBottomNavigationBarHeight * 1.5,
                  ),
                  sliver: Obx(
                    () => controller.isLoadingSesiones.value
                        ? const SliverToBoxAdapter(
                            child: CircularProgressIndicator(),
                          )
                        : SliverList(
                            delegate: SliverChildBuilderDelegate(
                              childCount: controller.sesiones.length,
                              (context, index) {
                                return buildSesionRow(index);
                              },
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildSesionRow(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.bgCell,
          boxShadow: const [
            BoxShadow(color: AppColors.bgCell, spreadRadius: 3),
          ],
        ),
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text("Fecha/Hora : ",
                      style: TextStyle(color: AppColors.bgWhite)),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child:
                      Text("IP : ", style: TextStyle(color: AppColors.bgWhite)),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child:
                      Text("OS : ", style: TextStyle(color: AppColors.bgWhite)),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text("Browser : ",
                      style: TextStyle(color: AppColors.bgWhite)),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    DateFormat("dd/MM/yyyy HH:mm:ss").format(
                      DateTime.fromMillisecondsSinceEpoch(
                        controller.sesiones[index].fecha!,
                        isUtc: false,
                      ),
                    ),
                    style: const TextStyle(color: AppColors.bgWhite),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "${controller.sesiones[index].ip}",
                    style: const TextStyle(color: AppColors.bgWhite),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "${controller.sesiones[index].sistemaOperativo}",
                    style: const TextStyle(color: AppColors.bgWhite),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "${controller.sesiones[index].navegador}",
                    style: const TextStyle(color: AppColors.bgWhite),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
