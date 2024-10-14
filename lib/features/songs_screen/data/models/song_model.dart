import 'package:hive_flutter/hive_flutter.dart';
part 'song_model.g.dart';

@HiveType(typeId: 2)
class SongModel {
  @HiveField(0)
  String songName;
  @HiveField(1)
  String singerName;
  @HiveField(2)
  String songType;
  
  
  SongModel({
  required this.singerName,
  required this.songName,
  required this.songType,
  });
}