import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/fatha_songs_screen/presentation/view/widgets/fatha_songs_listview.dart';
import 'package:zaghrota_app/features/fatha_songs_screen/presentation/view_model/cubit/fatha_songs_screen_cubit.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/add_button.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class FathaSongsScreen extends StatelessWidget {
  const FathaSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: const CustomAppBar(),
      floatingActionButton: BlocConsumer<FathaSongsScreenCubit, FathaSongsScreenState>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          var cubit = FathaSongsScreenCubit.get(context);
          return AddSongDataDialogue(
              songNamecontroller: cubit.controlSongName,
              singerNamecontroller: cubit.controlSingerName,
              notecontroller: cubit.controlSongType,
              formKey: cubit.formKey, onChanged: (p0) {
                
              }, addData: (){
                cubit.addSong();
              });
        },
      ),
      body: const FathaSongsListview(),
    ));
  }
}