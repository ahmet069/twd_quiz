import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../main.dart';
import '../../config/router/app_router.dart';
import '../../core/components/Admob/my_admob_banner.dart';
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
              const Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: MyAdmobBanner(
                  bannerId: 'ca-app-pub-4086698259318942/8570777432',
                  adSize: AdSize.banner,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(204, 255, 255, 255),
                ),
                child: Column(
                  children: const [
                    Text(
                      'TWD QUIZ',
                      style: TextStyle(
                        // color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                      ),
                    ),
                  ],
                ),
              ),
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
                      bacroundColor: const Color.fromARGB(83, 192, 192, 192),
                      textColor: Colors.white,
                      title: 'How To Play ?',
                      onPressed: () {},
                    ),
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
