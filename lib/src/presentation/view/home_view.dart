import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../main.dart';
import '../../config/router/app_router.dart';
import '../../core/components/Admob/my_admob_banner.dart';
import '../../core/components/Button/main_buttons.dart';
import '../../core/components/Button/transparent_button.dart';
import '../widget/home/button_area.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isConnected = false;
  Future<void> checkInternetConnection() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      setState(() {
        isConnected = false;
        print(false);
      });
    } else {
      setState(() {
        isConnected = true;
        print(true);
      });
    }
  }

  @override
  void initState() {
    checkInternetConnection().then((_) => super.initState());
  }

  @override
  Widget build(BuildContext context) {
    if (!isConnected) {
      return const Scaffold(
        body: Center(
          child: Text('Check your internet connection and try again ?'),
        ),
      );
    } else {
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
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: MyAdmobBanner(
                    bannerId: 'ca-app-pub-4086698259318942/8570777432',
                    adSize: AdSize.banner,
                  ),
                ),
                ButtonArea(),
                SizedBox(),
              ],
            ),
          ),
        ),
      );
      ;
    }
  }
}
