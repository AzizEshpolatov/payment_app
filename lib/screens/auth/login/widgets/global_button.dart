import 'package:flutter/cupertino.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/size/login_screen_size.dart';

class GlobalButton extends StatefulWidget {
  const GlobalButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final VoidCallback onTap;
  final String text;

  @override
  State<GlobalButton> createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  @override
  Widget build(BuildContext context) {
    heightLogin = MediaQuery.of(context).size.height;
    widthLogin = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.wl),
        padding: EdgeInsets.symmetric(vertical: 16.hl),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.wl),
          color: AppColors.c1317DD,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.white,
              fontSize: 14.wl,
            ),
          ),
        ),
      ),
    );
  }
}
