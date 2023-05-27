import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../core/components/Admob/my_admob_banner.dart';
import '../bloc/home_bloc/home_bloc.dart';
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
      });
    } else {
      setState(() {
        isConnected = true;
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
      return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
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
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: MyAdmobBanner(
                        bannerId: 'ca-app-pub-4086698259318942/8570777432',
                        adSize: AdSize.fullBanner,
                      ),
                    ),
                    ButtonArea(),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: MyAdmobBanner(
                        bannerId: 'ca-app-pub-4086698259318942/1853195962',
                        adSize: AdSize.fullBanner,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
