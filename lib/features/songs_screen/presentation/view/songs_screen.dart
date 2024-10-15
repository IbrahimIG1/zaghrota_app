import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/add_button.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/songs_listview.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view_model/cubit/farah_songs_screen_cubit.dart';

class SongsScreen extends StatelessWidget {
  const SongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      floatingActionButton: BlocConsumer<FarahSongsScreenCubit, FarahSongsScreenState>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          var cubit = FarahSongsScreenCubit.get(context);
          return AddSongDataDialogue(
            notecontroller: cubit.controlSongType,
            songNamecontroller: cubit.controlSongName,
            singerNamecontroller: cubit.controlSingerName,
              formKey: cubit.formKey, onChanged: (p0){},
               addData: (){
                cubit.addSong();
               });
        },
      ),
      appBar: const CustomAppBar(),
      body: const SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     SongsTopTitlesItemView(
            //       title: "اسم الأغنية",
            //     ),
            //     SongsTopTitlesItemView(title: "ملحوظة"),
            //     SongsTopTitlesItemView(title: "ترتيب التشغيل"),
            //   ],
            // ),
            SongsListview()
          ],
        ),
      ),
    ));
  }
}
