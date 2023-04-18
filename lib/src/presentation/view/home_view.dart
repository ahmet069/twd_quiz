import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main.dart';
import '../../config/router/app_router.dart';
import '../../core/components/Button/main_buttons.dart';
import '../../core/components/Button/transparent_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Container(
          height: 1.sh,
          width: 1.sw,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/homebg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const SizedBox(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    MainButton(
                      title: 'START QUIZ',
                      onPressed: () async {
                        await router.replace(const GameRouter());
                      },
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    ),
                    TransparentButton(
                      bacroundColor: Color.fromARGB(83, 192, 192, 192),
                      textColor: Colors.white,
                      title: 'How To Play ?',
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
