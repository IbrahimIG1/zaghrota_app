import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';

class HeartDrawer extends StatelessWidget {
  const HeartDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as DateTime;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: const Color.fromARGB(255, 223, 217, 217),width: 2.sp)
        )
      ),
      height: 0.25.sh,
      width: 1.sw,
      child: Center(
        child: Stack(
          children: [
           Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:20.sp ,vertical: 5.sp),
              child: Image.asset("assets/images/homepage_images/heart.png",fit: BoxFit.fill,),
            )),
            Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text("Mohamed & Eman",style: Textstyles.weddingNames,),
                    const VerticalSizedBox(height: 5),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40.w,
                          child: Column(
                            children: [
                              Text("${args.year - DateTime.now().year} :",style: Textstyles.hintTextStyle,),
                              Text("years",style: Textstyles.heartViewTextStyle,)
                            ],
                          ),
                        ),
                          SizedBox(
                          width: 40.w,
                          child: Column(
                            children: [
                              Text("${(args.month - DateTime.now().month).abs()} :",style: Textstyles.hintTextStyle,),
                              Text("months",style: Textstyles.heartViewTextStyle)
                            ],
                          ),
                        ),
                          SizedBox(
                          width: 40.w,
                          child: Column(
                            children: [
                              Text("${(args.day - DateTime.now().day).abs()}",style: Textstyles.hintTextStyle,),
                              Text("days",style: Textstyles.heartViewTextStyle,)
                            ],
                          ),
                        ),
                        ],
                     ),
                     const VerticalSizedBox(height: 5),
                     Text("Until our wedding",style: Textstyles.weddingNames,),
                     const VerticalSizedBox(height: 5),
                     Text("${args.year} - ${args.month} - ${args.day}",style: Textstyles.heartViewTextStyle,)
                    
                     
                  
                    
                    
                    
                  
                  ],
                ),

          ],
        ),
      ) ,
    );
    // return CustomPaint(
    //           painter: HeartPainter(),
    //           child: Container(
    //             padding:  EdgeInsets.symmetric(vertical: 10.r),
    //             height: 0.35.sh,
    //             width: 1.sw,
    //                    decoration: const BoxDecoration(
    //                     borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(10)),
    //                     border: Border(
    //                       bottom: BorderSide(color: AppColors.heartColor,width: 1),
    //                       // right: BorderSide(color: AppColors.heartColor,width: 1),
    //                       // left: BorderSide(color: AppColors.heartColor,width: 1),
    //                       )
    //                    ),
    //             child:
    //           ),
    //         );
  }
}

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.heartColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final path = Path();
    path.moveTo(size.width / 2, size.height / 4);

    // Left half of the heart
    path.cubicTo(
      size.width / 8, 0, // Control point 1
      0, size.height / 2.5, // Control point 2
      size.width / 2, size.height, // End point
    );

    // Right half of the heart
    path.moveTo(size.width / 2, size.height / 4);
    path.cubicTo(
      size.width * 7 / 8, 0, // Control point 1
      size.width, size.height / 2.5, // Control point 2
      size.width / 2, size.height, // End point
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}