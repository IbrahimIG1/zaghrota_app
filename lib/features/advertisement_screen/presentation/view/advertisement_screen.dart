import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class AdvertisementScreen extends StatelessWidget {
  const AdvertisementScreen({super.key, required this.height, required this.width, required this.imagePath, required this.pageSentence, required this.pageName});
 final double height;
 final double width;
 final String imagePath;
 final String pageSentence;
 final String pageName;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: const CustomAppBar(),
      body: GestureDetector(
        onTap: () {
          ControlNavigation().navigationToController(pageName:pageName , context: context);
        },
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalSizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.fitHeight)
                ),
                height: height ,
                width: width,
                
              ),
              const VerticalSizedBox(height: 10),
              Text(pageSentence,style:Textstyles.advertisementStyle )
            ],
          ),
        ),
      ),
    );
  }
}