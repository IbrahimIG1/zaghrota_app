import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/zafa_screen/presentation/view_model/cubit/zafa_images_cubit.dart';

class ZafaGridview extends StatelessWidget {
  const ZafaGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocConsumer<ZafaImagesCubit, ZafaImagesState>(
            listener: (context, state) {
             
            },
            builder: (context, state) {
              if(state is ZafaImagesSuccess){
              return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:state.images.length ,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 15.w),
                itemBuilder: (context, index) => CachedNetworkImage(
                  imageUrl:state.images[index].imageUrl! ,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholder: (context, url) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30.h,
                        child: const CircularProgressIndicator(color: AppColors.circleAvatarBorderColor,)),
                    ],
                  ),
                  imageBuilder:(context, imageProvider) =>  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(color: Colors.black),
                        image:  DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill)),
                  ),
                ),
              );}
              else if(state is ZafaImagesFailure){
                return Column(children: [
                  Text(state.errorMsg),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.circleAvatarBorderColor
                    ),
                    onPressed: () {
                    BlocProvider.of<ZafaImagesCubit>(context).getImages();
                  }, child: const Text("حاول مرة أخري"))
                ],);
              }

              else{
                return Padding(
                  padding: EdgeInsets.only(top: 0.4.sh,left: 0.5.sw),
                  child: const CircularProgressIndicator(color: AppColors.circleAvatarBorderColor,),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}