import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/ka3at_screen/presentation/view/widgets/ka3a_item.dart';
import 'package:zaghrota_app/features/ka3at_screen/presentation/view_model/cubit/get_ka3at_cubit.dart';

class Ka3atListview extends StatelessWidget {
  const Ka3atListview({super.key, required this.madinaId});
  final String madinaId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Getka3aCubit, Getka3aState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(state is Getka3aSuccess){
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 25.sp),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) =>
                const VerticalSizedBox(height: 25),
            shrinkWrap: true,
            itemBuilder: (context, index) =>  Ka3aItem(
              onTapwhats:()async {
                await launchUrl(Uri.parse("https://wa.me/+2${state.ka3at[index].phone!}"));
              } ,
              onTapLoc: ()async {
                await launchUrl(Uri.parse(state.ka3at[index].location!));
              },
              onTapface: ()async {
                await launchUrl(Uri.parse(state.ka3at[index].facebook!));
              },
              onTapInsta: ()async {
                await launchUrl(Uri.parse(state.ka3at[index].instagram!));
              },
              phone:state.ka3at[index].phone! ,
              face: state.ka3at[index].facebook!,
              location: state.ka3at[index].location!,
              instagram: state.ka3at[index].instagram!,
              ka3aName: state.ka3at[index].name!,
              image: state.ka3at[index].photos!,
            ),
            itemCount: state.ka3at.length,
          ),
        );}
        else if (state is Getka3aError){
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
                    BlocProvider.of<Getka3aCubit>(context).getKa3at(madinaId: madinaId);
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
