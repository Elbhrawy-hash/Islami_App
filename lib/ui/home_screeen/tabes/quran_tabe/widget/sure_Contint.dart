import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';

class SureContint extends StatelessWidget {
  final String contint;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const SureContint({
    super.key,
    required this.contint,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.01,horizontal: height * 0.01),
        margin: EdgeInsets.symmetric(horizontal: width * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? AppColor.goldColor: AppColor.goldColor,
            width: 2,
          ),
          color: isSelected
              ? AppColor.goldColor
              : Colors.transparent,
        ),
        child: Text(
          "$contint [${index + 1}] ",
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isSelected ? AppColor.blackColor :
            AppColor.goldColor,
          ),
        ),
      ),
    );
  }
}
