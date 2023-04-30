import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../main.dart';
import '../../../config/color/app_color.dart';
import '../../../config/router/app_router.dart';
import '../../../core/components/Button/main_buttons.dart';
import '../../../core/components/Button/transparent_button.dart';
import '../../../core/components/Dialog/how_to_play_dilog.dart';

class ButtonArea extends StatelessWidget {
  const ButtonArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(163, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      width: .86.sw,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          MainButton(
            title: 'START QUIZ',
            onPressed: () async {
              await router.replace(const GameRouter());
            },
            backgroundColor: AppColor.buttonGreen,
            textColor: Colors.black,
          ),
          TransparentButton(
            bacroundColor: const Color.fromARGB(158, 0, 0, 0),
            textColor: Colors.white,
            title: 'How To Play ?',
            onPressed: () async {
              // await router.replace(const HomeRouter());
              return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const HowToPlayDialog();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
