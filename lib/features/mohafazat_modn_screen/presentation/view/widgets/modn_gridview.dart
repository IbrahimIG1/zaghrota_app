import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/features/ka3at_screen/presentation/view/ka3at_screen.dart';
import 'package:zaghrota_app/features/ka3at_screen/presentation/view_model/cubit/get_ka3at_cubit.dart';
import 'package:zaghrota_app/features/mohafazat_modn_screen/presentation/view_model/cubit/get_modn_cubit.dart';
import 'package:zaghrota_app/features/mohafzat_screen/presentation/view/mohafzat_item.dart';

class ModnGridview extends StatelessWidget {
  const ModnGridview({super.key, required this.mohafzaId});
  final String mohafzaId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetModnCubit, GetModnState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetModnSuccess) {
          return GridView.builder(
            // physics: const NeverScrollableScrollPhysics(),
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
                          create: (context) => Getka3aCubit()..getKa3at(madinaId:state.modn[index].sId!),
                          child: Ka3atScreen(
                            madinaId: state.modn[index].sId!,
                          ),
                        ),
                      ));
                },
                location: state.modn[index].name!,
                index: index),
            itemCount: state.modn.length,
          );
        } else if (state is GetModnError) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "error: ${state.errorMsg}",
                  style: Textstyles.nOfInvitedPeopleStyle,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.circleAvatarBorderColor
                  ),
                    onPressed: () {
                      BlocProvider.of<GetModnCubit>(context)
                          .getModn(mohafzaId: mohafzaId);
                    },
                    child: Text(
                      "حاول مرة أخري",
                      style: Textstyles.nOfInvitedPeopleStyle,
                    ))
              ],
            ),
          );
        } else {
          return const Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircularProgressIndicator(
                    color: AppColors.checkBoxActiveColor,
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
