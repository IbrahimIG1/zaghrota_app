import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/ads_helper/ads_helper.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/ads_view/presentation/view/ads_view.dart';
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
          log(imagePath);
          if(imagePath=="assets/images/advertisementpage_images/dress.png"){
            showDialog(context: context,
             builder:(context) =>  AlertDialog(
              backgroundColor: AppColors.scaffoldColor,
              title: Center(child: Text("تنوية",style: Textstyles.advertisementStyle,)),
              content: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 7.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Padding(
                       padding: EdgeInsets.symmetric(vertical: 20.h),
                       child: Text("هذا القسم يحتوي علي صور خاصة بالسيدات فاذا كنت رجلا تذكر ان الله امرك بغض البصر",
                       style:Textstyles.darkTextStyle.copyWith(fontSize: 15.sp) ,),
                     ),
                     Padding(
                       padding:  EdgeInsets.only(bottom: 20.h),
                       child: Text(" قُل لِّلْمُؤْمِنِينَ يَغُضُّوا مِنْ أَبْصَارِهِمْ وَيَحْفَظُوا فُرُوجَهُمْ ۚ ذَٰلِكَ أَزْكَىٰ لَهُمْ ۗ إِنَّ اللَّهَ خَبِيرٌ بِمَا يَصْنَعُونَ",style: Textstyles.blackStroke,textAlign: TextAlign.center,),
                     ),
                     ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.circleAvatarBorderColor
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                            ControlNavigation.navigationToController(pageName:pageName , context: context);
                       
                     }, child: Text("استكمال التصفح",style: Textstyles.weddingNames.copyWith(color: Colors.white),))
                    ],
                  ),
                ),
              ),
              
             ));
      
          }
          else if (imagePath=="assets/images/advertisementpage_images/zafa.png"||
          imagePath=="assets/images/advertisementpage_images/session.png"){
            AdsHelper().interstitialAdshow();
          ControlNavigation.navigationToController(pageName:pageName , context: context);
            
    
          }
          else{
            
            // log("aha");
          ControlNavigation.navigationToController(pageName:pageName , context: context);
      
          }
        
        
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
              Text(pageSentence,style:Textstyles.advertisementStyle ),
              const Spacer(),
              const AdsView()
      
            ],
          ),
        ),
      ),
    );
  }
}