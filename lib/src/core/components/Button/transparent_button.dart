import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransparentButton extends StatelessWidget {
  final String title;
  final Color bacroundColor;
  final Color textColor;
  final Function onPressed;
  const TransparentButton({
    super.key,
    required this.bacroundColor,
    required this.textColor,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: .5.sw,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bacroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
        child: Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),
        onPressed: () {
          // ignore: avoid_dynamic_calls
          onPressed();
        },
      ),
    );
  }
}
