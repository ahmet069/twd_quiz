import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBottom extends StatelessWidget {
  const HomeBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: .12.sh,
      decoration: BoxDecoration(
        color: const Color.fromARGB(86, 255, 255, 255),
        borderRadius: BorderRadius.vertical(top: Radius.elliptical(.40.sw, .10.sw)),
      ),
      // child: const MyAdmobBanner(
      //   bannerId: 'ca-app-pub-4086698259318942/1853195962',
      //   adSize: AdSize.mediumRectangle,
      // ),
    );
  }
}
