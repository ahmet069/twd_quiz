import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main.dart';
import '../../config/router/app_router.dart';

class NetworkView extends StatelessWidget {
  const NetworkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(),
          SizedBox(
            width: 1.sw,
            child: Image.asset('assets/images/connect.jpg'),
          ),
          IconButton(
            iconSize: 50,
            alignment: Alignment.center,
            icon: const Icon(
              Icons.replay,
            ),
            onPressed: () async {
              router.replace(const HomeRouter());
            },
          ),
        ],
      ),
    );
  }
}
