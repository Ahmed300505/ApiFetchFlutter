import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
    required this.containerText,
    required this.containerImage,
    required this.containerColor
  });

  final String containerText;
  final String containerImage;
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(image: NetworkImage(containerImage))
      ),
      child: Text(containerText),
    );
  }
}