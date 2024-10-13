import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';

class Ka3aItem extends StatelessWidget {
  const Ka3aItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                CarouselSlider.builder(
                  
                  itemCount: 10,
                  itemBuilder: (context, index, realIndex) => SizedBox(
                    height: 0.3.sh,
                    width: 0.87.sw,
                    child: Image.asset("assets/images/ka3at_screen_images/ka3a.png",fit: BoxFit.fill,)), 
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    viewportFraction: 0.9,
                  height: 0.3.sh,
                  
                )),
                
                const VerticalSizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.sp),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                   
                  Text("قاعة الميريلاند",style: Textstyles.advertisementStyle,),
                  Row(
                    children: [
                      SizedBox(
                        height: 30.h,
                        width: 30.w,
                        child: Image.asset("assets/images/ka3at_screen_images/Location.png",fit: BoxFit.fill,),
                      ),
                      SizedBox(
                        height: 30.h,
                        width: 30.w,
                        child: Image.asset("assets/images/ka3at_screen_images/Instagram2.png",fit: BoxFit.fill,),
                      ),
                      SizedBox(
                        height: 30.h,
                        width: 30.w,
                        child: Image.asset("assets/images/ka3at_screen_images/WhatsApp.png",fit: BoxFit.fill,),
                      ),
                      SizedBox(
                        height: 30.h,
                        width: 30.w,
                        child: Image.asset("assets/images/ka3at_screen_images/Facebook.png",fit: BoxFit.fill,),
                      )
                    ],
                  )
                  ],),
                )
              ],
            );
  }
}