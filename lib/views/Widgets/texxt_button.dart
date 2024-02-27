import 'package:flutter/material.dart';

import '../theme.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final EdgeInsets margin;
  final VoidCallback? onTap;
  CustomTextButton({
    super.key,
    this.title = '',
    this.margin = EdgeInsets.zero,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      margin: margin,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: Color.fromRGBO(120, 178, 163, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }
}
// Footer
