import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/song_item.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view_model/cubit/farah_songs_screen_cubit.dart';

class SongsListview extends StatelessWidget {
  const SongsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FarahSongsScreenCubit, FarahSongsScreenState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        var cubit = FarahSongsScreenCubit.get(context);
        if (state is FarahSongsScreenSuccess){
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
            else if (state is FarahSongsScreenFailure){
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
