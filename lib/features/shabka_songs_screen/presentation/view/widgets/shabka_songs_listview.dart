import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/shabka_songs_screen/presentation/view_model/cubit/shabka_songs_screen_cubit.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/song_item.dart';


class ShabkaSongsListview extends StatelessWidget {
  const ShabkaSongsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShabkaSongsScreenCubit, ShabkaSongsScreenState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        var cubit = ShabkaSongsScreenCubit.get(context);
        if (state is ShabkaSongsScreenSuccess){
        return ReorderableListView.builder(
            onReorder: (oldIndex, newIndex) {
              cubit.updateOrder(oldIndex: oldIndex, newIndex: newIndex,);
            },
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => SongItem(
              songName: state.songs[index].songName,
              singerName: state.songs[index].singerName,
              note: state.songs[index].songType,
                  key: ValueKey(index),
                ),
            itemCount: state.songs.length);}
            else if (state is ShabkaSongsScreenFailure){
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
}
