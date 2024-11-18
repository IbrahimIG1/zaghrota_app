import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/features/mohafazat_modn_screen/presentation/view/mohafzat_modn_screen.dart';
import 'package:zaghrota_app/features/mohafazat_modn_screen/presentation/view_model/cubit/get_modn_cubit.dart';
import 'package:zaghrota_app/features/mohafzat_screen/presentation/view/mohafzat_item.dart';
import 'package:zaghrota_app/features/mohafzat_screen/presentation/view_model/cubit/get_mohafza_cubit.dart';

class MohafzatGridview extends StatelessWidget {
  const MohafzatGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetMohafzaCubit, GetMohafzaState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetMohafzaSuccess) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 20.sp),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h),
            itemBuilder: (context, index) => MohafzatItem(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => GetModnCubit()..getModn(mohafzaId: state.mohafzat[index].sId!),
                          child:  MohafzatModnScreen(mohafzaId: state.mohafzat[index].sId!,),
                        ),
                      ));
                },
                location: state.mohafzat[index].name!,
                index: index),
            itemCount: state.mohafzat.length,
          );
        } else if (state is GetMohafzaFailure) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "error: ${state.errorMsg}",
                style: Textstyles.nOfInvitedPeopleStyle,
              ),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<GetMohafzaCubit>(context).getMohafzat();
                  },
                  child: Text(
                    "حاول مرة أخري",
                    style: Textstyles.nOfInvitedPeopleStyle,
                  ))
            ],
          );
        } else {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: AppColors.checkBoxActiveColor,
              )
            ],
          );
        }
      },
    );
  }
}
