import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/color/app_color.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../widget/home/button_area.dart';
import '../widget/home/home_bottom.dart';
import '../widget/home/home_header.dart';
import 'network_view.dart';

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
      return const NetworkView();
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
                  color: AppColor.darkBlue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    HomeHeader(),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 10.0),
                    //   child: MyAdmobBanner(
                    //     bannerId: 'ca-app-pub-4086698259318942/8570777432',
                    //     adSize: AdSize.fullBanner,
                    //   ),
                    // ),
                    ButtonArea(),
                    // Padding(
                    //   padding: EdgeInsets.only(bottom: 10.0),
                    //   child: MyAdmobBanner(
                    //     bannerId: 'ca-app-pub-4086698259318942/1853195962',
                    //     adSize: AdSize.fullBanner,
                    //   ),
                    // ),
                    HomeBottom(),
                    // Placeholder(),
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
