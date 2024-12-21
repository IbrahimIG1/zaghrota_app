import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/fatha_songs_screen/presentation/view_model/cubit/fatha_songs_screen_cubit.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_text_field.dart';
import 'package:zaghrota_app/features/songs_screen/data/models/song_model.dart';



import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/song_item.dart';


class FathaSongsListview extends StatelessWidget {
  const FathaSongsListview({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> keey = GlobalKey<FormState>();
    return BlocConsumer<FathaSongsScreenCubit, FathaSongsScreenState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        var cubit = FathaSongsScreenCubit.get(context);
        if (state is FathaSongsScreenSuccess){
        return state.songs.isEmpty? Center(child: Text("لازلت لم تضف شيئا...",style: Textstyles.listViewTitles,),):ReorderableListView.builder(
            onReorder: (oldIndex, newIndex) {
              cubit.updateOrder(oldIndex: oldIndex, newIndex: newIndex,);
            },
             
            shrinkWrap: true,
            itemBuilder: (context, index) => SongItem(
              editPressed: () {
                editSongDialog(context, keey, cubit, index);
              },
              deletePressed: () {
                deleteDialog(context, cubit, index);
              },
              songName: state.songs[index].songName,
              singerName: state.songs[index].singerName,
              note: state.songs[index].songType,
                  key: ValueKey(index),
                ),
            itemCount: state.songs.length);}
            else if (state is FathaSongsScreenFailure){
              return Center(child: Text("Error: ${state.errormsg}"),);
            }
            else{
              return const Center(child: CircularProgressIndicator(

                color: AppColors.circleAvatarBorderColor,
              ),);
            }
      },
      
    );
  }

  void deleteDialog(BuildContext context, FathaSongsScreenCubit cubit, int index) {
            showDialog(context: context, builder: (context) => AlertDialog(
          title: Center(child: Text("تأكيد الحذف",style: Textstyles.nameOfInvitedPeopleStyle,)),
          content: SingleChildScrollView(
            child: Column(
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
                    cubit.deleteItem(index: index);
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
          ),
        ),);
  }

  void editSongDialog(BuildContext context, GlobalKey<FormState> keey, FathaSongsScreenCubit cubit, int index) {
    showDialog(context: context, builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Center(child: Text("تعديل الأغنية",style: Textstyles.nameOfInvitedPeopleStyle,)),
      content: Form(
        key: keey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Customtextfield(
                controller: cubit.controlEditSongName,
               
                hintText: "اسم الأغنية", useStyle2: false,
              validator: (p0) {
                if(p0!.isEmpty){
                    return "من فضلك ادخل الأغنية";
                
                }
                return null;
              },
              ),
            const VerticalSizedBox(height: 15),
             
              Customtextfield(
                controller: cubit.controlEditSingerName,
               
                validator: (value) {
                  if (value!.isEmpty) {
                    return "من فضلك ادخل المغني";
                  }
                  return null;
                },
                
                hintText: "اسم المغني",
                useStyle2: false),
            const VerticalSizedBox(height: 15),
                 
                 Customtextfield(
                controller: cubit.controlEditSongType,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "من فضلك ادخل نوع الأغنية";
                  }
                  return null;
                },
                
                hintText: "ادخل نوع الأغنية( سلو- مهرجان)",
                useStyle2: false),
          
            const VerticalSizedBox(height: 15),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.circleAvatarBorderColor),
                onPressed: () async {
                   if(keey.currentState!.validate()){
                   
                    cubit.updateData(index: index, song:
                     SongModel(singerName:cubit.controlEditSingerName.text , songName: cubit.controlEditSongName.text, songType: cubit.controlEditSongType.text));
                    cubit.controlEditSongName.clear();
                    cubit.controlEditSingerName.clear();
                    cubit.controlEditSongType.clear();
                    Navigator.pop(context);
              
                   }
                   
                  
                },
                child: Text(
                  "اضافة",
                  style: Textstyles.songsTopTitleStyle,
                ))
            ],
          ),
        ),
      ),
    ),);
  }

}
