import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/hena_notes_screen/presentation/view_model/cubit/hena_notes_screen_cubit.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';
import 'package:zaghrota_app/features/wedding_notes_screen/presentation/view/widgets/add_button_note.dart';
import 'package:zaghrota_app/features/wedding_notes_screen/presentation/view/widgets/wedding_notes_listview.dart';

class HenaNotesScreen extends StatelessWidget {
  const HenaNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButton:
          BlocConsumer<HenaNotesScreenCubit, HenaNotesScreenState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HenaNotesScreenCubit.get(context);
          return AddNoteDataDialogue(
              dateNotecontroller: cubit.datecont,
              formKey: cubit.keey,
              onChanged: (c) {},
              titleNotecontroller: cubit.title,
              contentNotecontroller: cubit.content,
              addData: () {
                cubit.addData();
              });
        },
      ),
      backgroundColor: AppColors.scaffoldColor,
      body: BlocConsumer<HenaNotesScreenCubit, HenaNotesScreenState>(
              listener: (context, state) {
      // TODO: implement listener
              },
              builder: (context, state) {
              var cubit = HenaNotesScreenCubit.get(context);
      
               if (state is HenaNotesScreenSuccess){
      return WeddingNotesListview(
        onDeletePressed: (index){
          deleteDialog(context, cubit, index);
        },
        data: state.notes,);
               
               }
               else if (state is HenaNotesScreenFailure){
      return Center(child: Text("error : ${state.errormsg}"),);
               
               }
               else{
      return const CircularProgressIndicator(color: AppColors.circleAvatarBorderColor,);
               }
               
              },
            ),
    ));
  }
  

  void deleteDialog(BuildContext context, HenaNotesScreenCubit cubit, int index) {
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
                  cubit.deleteData(index: index);
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