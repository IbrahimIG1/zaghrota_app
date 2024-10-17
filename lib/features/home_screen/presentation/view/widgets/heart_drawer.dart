import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/login_screen/data/farah_model.dart';

class HeartDrawer extends StatelessWidget {
  const HeartDrawer({super.key, required this.data, this.onTap});
  final List<FarahModel> data;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
   
    // List args = ModalRoute.of(context)?.settings.arguments as List;
    return Padding(
      padding: EdgeInsets.only(top: 7.sp),
      child: 
 GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/homepage_images/heart.png",
                    ),
                    fit: BoxFit.fill),
              ),
              height: 0.20.sh,
              width: 0.6.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${data[0].aresName} & ${data[0].arosaName}",
                    style: Textstyles.weddingNames,
                  ),
                  const VerticalSizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 0.1.sw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${data[0].farahTime.year - DateTime.now().year}",
                                style: Textstyles.darkTextStyle,
                              ),
                              Text(
                                "years",
                                style: Textstyles.heartViewTextStyle,
                              )
                            ],
                          ),
                        ),
                        Text(
                          ":",
                          style: Textstyles.darkTextStyle,
                        ),
                        SizedBox(
                          width: 0.25.sw,
                          child: Column(
                            children: [
                              Text(
                                "${(data[0].farahTime.month - DateTime.now().month).abs()}",
                                style: Textstyles.darkTextStyle,
                              ),
                              Text("months",
                                  style: Textstyles.heartViewTextStyle)
                            ],
                          ),
                        ),
                        Text(
                          ":",
                          style: Textstyles.darkTextStyle,
                        ),
                        SizedBox(
                          width: 0.1.sw,
                          child: Column(
                            children: [
                              Text(
                                "${(data[0].farahTime.day - DateTime.now().day).abs()}",
                                style: Textstyles.darkTextStyle,
                              ),
                              Text(
                                "days",
                                style: Textstyles.heartViewTextStyle,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //  const VerticalSizedBox(height: 5),
                  Text(
                    "Until our wedding",
                    style: Textstyles.weddingNames,
                  ),
                  //  const VerticalSizedBox(height: 5),
                  Text(
                    "${data[0].farahTime.year} - ${data[0].farahTime.month} - ${data[0].farahTime.day}",
                    style: Textstyles.darkTextStyle,
                  )
                ],
              ),
            ),
          )
            
        
        
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


final GlobalKey<FormState> keeey = GlobalKey<FormState>();

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
