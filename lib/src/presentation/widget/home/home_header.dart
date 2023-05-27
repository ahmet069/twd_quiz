import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/color/app_color.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 0.22.sh,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(.40.sw, .10.sw)),
        image: const DecorationImage(
          image: AssetImage('assets/images/homebg.jpg'),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          colorFilter: ColorFilter.mode(
            AppColor.darkBlue,
            BlendMode.color,
          ),
        ),
      ),
      child: const Text(
        'THE WALKING\nDEAD',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 30,
        ),
      ),
    );
  }
}
