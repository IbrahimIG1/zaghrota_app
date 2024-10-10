import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/badla_screen/data/model/badla_model.dart';
import 'package:zaghrota_app/features/badla_screen/presentation/view/widgets/badla_item.dart';
import 'package:zaghrota_app/features/badla_screen/presentation/view_model/cubit/badla_screen_cubit.dart';

class BadlaScreenListview extends StatelessWidget {
  const BadlaScreenListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp),
      child: BlocConsumer<BadlaScreenCubit, BadlaScreenState>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          var cubit = BadlaScreenCubit.get(context);
          if(state is BadlaScreenFailure){
            return  Center(child: Text(
              "error:${state.errormsg}",
              style: Textstyles.listViewTitles,
            ),);
          }
          if(state is BadlaScreenSuccess){
          return ListView.separated(
            separatorBuilder: (context, index) =>
                const VerticalSizedBox(height: 10),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var data= state.badlaItems;
              return BadlaItem(itemName: data[index].badlaItemName, checked: data[index].checked,
              checkOnChanged: (p0) {
                data[index].checked=p0!;
                cubit.updateCheckedValue(index: index, badlamodel: BadlaModel(
                  badlaItemName:data[index].badlaItemName,checked: data[index].checked )
                  );
              },

              deleteOnPressed: () {
                deleteDialog(context, cubit, index);
              },
              );
              
            },
            itemCount: state.badlaItems.length,
          );}
          
          else{
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.circleAvatarBorderColor,

              ),
            );
          }
        },
      ),
    );
  }

  void deleteDialog(BuildContext context, BadlaScreenCubit cubit, int index) {
            showDialog(context: context, builder: (context) => AlertDialog(
          title: Center(child: Text("تأكيد الحذف",style: Textstyles.nameOfInvitedPeopleStyle,)),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
            SizedBox(
              width: 0.5.sw,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green
                ),
                onPressed: ()async {
                 await cubit.deleteItem(index: index);
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                 child: Text("نعم",style: Textstyles.songsTopTitleStyle,)),
            ),
          const VerticalSizedBox(height: 1),
          SizedBox(
            width: 0.5.sw,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red
                ),
                onPressed: () {
              Navigator.pop(context);
            }, child: Text("لا",style: Textstyles.songsTopTitleStyle,)),
          )
          
          ],),
        ),);
  }
}
