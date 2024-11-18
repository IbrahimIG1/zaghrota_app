import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';

class Ka3aItem extends StatelessWidget {
  const Ka3aItem({super.key, required this.image, required this.ka3aName, required this.face, required this.location, required this.instagram, this.onTapLoc, this.onTapInsta, this.onTapface});
  final String image;
  final String ka3aName;
  final String face;
  final String location;
  final String instagram;
  final void Function()? onTapLoc;
  final void Function()? onTapInsta;
  final void Function()? onTapface;
  
  
  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                CarouselSlider.builder(
                  
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) => CachedNetworkImage(
                    imageUrl: "https://zaghrota.aiotgroups.com//wedding-halls//$image/${index+1}.jpg",
                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error),),
                    placeholder:(context, url) =>  const Center(child: CircularProgressIndicator(color: AppColors.circleAvatarBorderColor,),),
                    imageBuilder:(context, imageProvider) =>  Container(
                      height: 0.3.sh,
                      width: 0.87.sw,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: imageProvider,fit: BoxFit.fill)
                      ), 
                       ),
                  ), 
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
                   
                  Container(
                    width: 0.7.sw,
                    constraints: BoxConstraints(
                      maxWidth: 0.5.sw
                    ),
                    child: Text(ka3aName,style: Textstyles.advertisementStyle,)),
                  Row(
                    children: [
                      location=="_"? const SizedBox():GestureDetector(
                        onTap: onTapLoc,
                        child: SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: Image.asset("assets/images/ka3at_screen_images/Location.png",fit: BoxFit.fill,),
                        ),
                      ),
                     instagram =="_"? const SizedBox(): GestureDetector(
                      onTap: onTapInsta,
                       child: SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: Image.asset("assets/images/ka3at_screen_images/Instagram2.png",fit: BoxFit.fill,),
                        ),
                     ),
                     
                      location=="_"? const SizedBox():GestureDetector(
                        onTap: onTapface,
                        child: SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: Image.asset("assets/images/ka3at_screen_images/Facebook.png",fit: BoxFit.fill,),
                        ),
                      )
                    ],
                  )
                  ],),
                )
              ],
            );
  }
}