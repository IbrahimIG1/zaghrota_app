import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/hena_songs_screen/presentation/view/widgets/hena_songs_listview.dart';
import 'package:zaghrota_app/features/hena_songs_screen/presentation/view_model/cubit/hena_songs_cubit.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/add_button.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class HenaSongsScreen extends StatelessWidget {
  const HenaSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: BlocConsumer<HenaSongsCubit, HenaSongsState>(
        listener: (context, state) {
        
        },
        builder: (context, state) {
          var cubit = HenaSongsCubit.get(context);
          return AddSongDataDialogue(
               songNamecontroller: cubit.controlSongName,
               singerNamecontroller: cubit.controlSingerName,
               notecontroller: cubit.controlSongType,
              formKey: cubit.formKey, onChanged: (p0){}, addData: (){
                cubit.addSong();
              });
        },
      ),
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(),
      body: const HenaSongsListview(),
    ));
  }
}
