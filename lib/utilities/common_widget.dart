import 'package:ayurveda/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';

AppBar commonAppBar(
    String titleName,
    Color bColor
    ) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    scrolledUnderElevation: 0,
    titleSpacing: 0,
    leading: IconButton(
        onPressed: (){},
        icon: Icon(Icons.arrow_back),
    ),
    actions: [
      Container(
        padding: EdgeInsets.only(right: 20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(
              Icons.notifications_none_outlined,
              size: 32,
            ),

            // Badge
            Positioned(
              right: -2,
              top: -2,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                child: const Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}

class CommonButton extends StatelessWidget {
  final Function()? onTap;
  final Color bgColor;
  final Color txtColor;
  final String? text;
  final IconData? icon;

  const CommonButton({
    super.key,
    this.onTap,
    required this.text,
    this.icon,
    required this.bgColor,
    required this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: context.cWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: bgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: txtColor, size: 20),
              const SizedBox(width: 8),
            ],
            Text(
              text!,
              style: TextStyle(
                color: txtColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}