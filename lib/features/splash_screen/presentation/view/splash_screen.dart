
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/core/shared_prefrence_helper/shared_prefrences_helper.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/badla_screen/data/model/badla_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/invited_model.dart';
import 'package:zaghrota_app/features/login_screen/data/farah_model.dart';
import 'package:zaghrota_app/features/songs_screen/data/models/song_model.dart';
import 'package:zaghrota_app/features/wedding_notes_screen/data/model/note_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
bool move=false;
void navigation(context)async{
  Future.delayed(const Duration(seconds: 5,),() {
    Navigator.pushReplacementNamed(context,SharedPrefrenceHelper.sharedPreferences!.getString("hash") == null
                ? ScreenNames.loginScreen
                : ScreenNames.homeScreen );
   
  },);
}

void initializeNedded()async{
  Hive.registerAdapter(InvitedModelAdapter());
  Hive.registerAdapter(BadlaModelAdapter());
  Hive.registerAdapter(SongModelAdapter());
  Hive.registerAdapter(DevicesModelAdapter());
  Hive.registerAdapter(FarahModelAdapter());
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<FarahModel>(BoxesNames.farahBox);
  await Hive.openBox<InvitedModel>(BoxesNames.invitedPeoples);
  await Hive.openBox<InvitedModel>(BoxesNames.invitedPeopleHena);
  await Hive.openBox<InvitedModel>(BoxesNames.invitedPeopleShabka);
  await Hive.openBox<InvitedModel>(BoxesNames.invitedPeopleFatha);
  await Hive.openBox<BadlaModel>(BoxesNames.badlaitems);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesBath);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesKitchen);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesMafrooshat);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesHoneyMoon);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesElectronics);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesDailyClothes);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesNoomClothes);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesHomeOccClothes);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesCentianClothes);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesFormalClothes);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesUnFormalClothes);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesSportsClothes);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesHarirClothes);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesAccessories);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesShoes);
  await Hive.openBox<DevicesModel>(BoxesNames.devicesR2sClothes);
  await Hive.openBox<bool>(BoxesNames.dressChecks);
  await Hive.openBox<bool>(BoxesNames.clothesChecks);
  await Hive.openBox<bool>(BoxesNames.sessionChecks);
  await Hive.openBox<SongModel>(BoxesNames.songsFarah);
  await Hive.openBox<SongModel>(BoxesNames.songshena);
  await Hive.openBox<SongModel>(BoxesNames.songsShabka);
  await Hive.openBox<SongModel>(BoxesNames.songsFatha);
  await Hive.openBox<NoteModel>(BoxesNames.weddingNotesBox);
  await Hive.openBox<NoteModel>(BoxesNames.fathaNotesBox);
  await Hive.openBox<NoteModel>(BoxesNames.henaNotesBox);
  await Hive.openBox<NoteModel>(BoxesNames.shabkaNotesBox);
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      
      setState(() {
        move = true; // Start the animation.
      });
    });
    
    navigation(context);
    initializeNedded();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedAlign(alignment:move?AlignmentDirectional.bottomEnd: AlignmentDirectional.bottomStart , duration:const  Duration(milliseconds: 4500),
          child: SizedBox(
            height: 160.h,
            width: 160.w,
            child: Image.asset("assets/images/login_images/couple5.png",fit: BoxFit.fill,)),
          ),
          Shimmer.fromColors(
            baseColor: AppColors.circleAvatarBorderColor,
            highlightColor: Colors.white,
            child: Text("ليلة العمر",style:TextStyle(
              shadows: const [
                Shadow(
              offset: Offset(2, 2),
              blurRadius: 0.2,
              color: AppColors.circleAvatarBorderColor)],
              fontSize: 30.sp,color: AppColors.circleAvatarBorderColor,fontFamily: "pal")),
          ),
          LoadingAnimationWidget.twistingDots(leftDotColor: AppColors.circleAvatarBorderColor, rightDotColor: Colors.black, size:30.sp)
        ],
      ),
    ));
  }
}