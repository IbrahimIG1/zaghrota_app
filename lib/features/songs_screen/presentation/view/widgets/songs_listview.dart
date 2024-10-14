import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/song_item.dart';

class SongsListview extends StatelessWidget {
  const SongsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => const SongItem(), 
            separatorBuilder: (context, index) => const VerticalSizedBox(height: 15), itemCount: 5);
  }
}