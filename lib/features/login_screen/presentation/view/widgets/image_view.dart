import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    width: 161.15,
                    height:230 ,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/login_images/wedding_couple_love.png"))
                    ),
                  );
  }
}