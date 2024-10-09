import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/textstyles/weights.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class AdvertisementScreen extends StatelessWidget {
  const AdvertisementScreen({super.key, required this.height, required this.width, required this.imagePath, required this.pageSentence});
 final double height;
 final double width;
 final String imagePath;
 final String pageSentence;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height ,
            width: width,
            child: Image.asset(imagePath,fit: BoxFit.fill,),
          ),
          const VerticalSizedBox(height: 5),
          Text(pageSentence,style:Textstyles.AdvertisementStyle )
        ],
      ),
    );
  }
}