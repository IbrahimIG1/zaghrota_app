import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/invited_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view/widgets/visitor_item.dart';
import 'package:zaghrota_app/features/invited_people_shabka_screen/presentation/view_model/cubit/invited_people_screen_shabka_cubit.dart';
import 'package:zaghrota_app/features/invited_people_shabka_screen/presentation/view_model/cubit/invited_people_screen_shabka_state.dart';

class InvitedPeopleShabkaListvieew extends StatelessWidget {
  const InvitedPeopleShabkaListvieew({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InvitedPeopleScreenShabkaCubit, InvitedPeopleScreenShabkaState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        var cubit = InvitedPeopleScreenShabkaCubit.get(context);
        if(state is GetInvitedPeopleScreenShabkaStateFailure){
          return Center(child: Text("Failed!:${state.errormsg}"));
        }
        else if(state is GetInvitedPeopleScreenShabkaStateSucess){
          List<InvitedModel> data = state.invitedPeopleData;
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(10.sp),
            child:  VisitorItem(
              onPressed: () async{
                deleteDialog(context, cubit, index);
               
              },
              onChanged: (p0) {
                data[index].checked=p0!;
                cubit.updateCheck(index: index, value: InvitedModel(name: data[index].name,
                 numberOfInvitedPeople: data[index].numberOfInvitedPeople,
                 checked: data[index].checked));
              },
              name: data[index].name,
            numbersOfPeople:data[index].numberOfInvitedPeople,
            checked: data[index].checked,),
          ),
          itemCount: state.invitedPeopleData.length,
          separatorBuilder: (context, index) =>
            const VerticalSizedBox(height: 5),
        );
      }
      else{
        return const Center(child: CircularProgressIndicator(
          color: AppColors.circleAvatarBorderColor,
        ),);
      }
      },
    );
  }

  void deleteDialog(BuildContext context, InvitedPeopleScreenShabkaCubit cubit, int index) {
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
