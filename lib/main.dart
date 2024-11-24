import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/app_Themes/app_theme.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/core/shared_prefrence_helper/shared_prefrences_helper.dart';
import 'package:zaghrota_app/features/advertisement_screen/presentation/view/advertisement_screen.dart';
import 'package:zaghrota_app/features/appointement_screen/presentation/view/appointment_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_accessories_screen/presentation/view/arosa_devices_accessories_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_accessories_screen/presentation/view_model/cubit/accessories_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/presentation/view/arosa_devices_bath_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/presentation/view_model/cubit/devices_bath_screen_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_centain_clothes_screen/presentation/view/arosa_devices_centian_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_centain_clothes_screen/presentation/view_model/cubit/centain_clothes_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_clothes_daily_screen/presentation/view/arosa_devices_clothes_daily_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_clothes_daily_screen/presentation/view_model/cubit/devices_daily_clothes_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_clothes_screen/presentation/view/arosa_devices_clothes_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_clothes_screen/presentation/view_model/cubit/clothes_screen_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_electronics_screen/presentation/view/arosa_devices_electronics_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_electronics_screen/presentation/view_model/cubit/devices_electronics_screen_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_formal_clothes_screen/presentation/view/arosa_devices_formal_clothes_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_formal_clothes_screen/presentation/view_model/cubit/formal_clothes_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_harir_clothes_screen/presentation/view/arosa_devices_harir_clothes_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_harir_clothes_screen/presentation/view_model/cubit/harir_clothes_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_home_occ_screen/presentation/view/arosa_devices_home_occ_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_home_occ_screen/presentation/view_model/cubit/home_occ_clothes_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_honeymonth_screen/presentation/view/arosa_devices_honemonth_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_honeymonth_screen/presentation/view_model/cubit/devices_honey_month_screen_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_kitchen_screen/presentation/view/arosa_devices_kitchen_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_kitchen_screen/presentation/view_model/cubit/devices_kitchen_screen_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_mafroshat_screen/presentation/view/arosa_devices_mafroshat_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_mafroshat_screen/presentation/view_model/cubit/devices_mafroshaat_screen_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_noom_screen/presentation/view/arosa_devices_noom_clothes_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_noom_screen/presentation/view_model/cubit/noom_clothes_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_r2s_clothes_screen/presentation/view/arosa_devices_r2s_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_r2s_clothes_screen/presentation/view_model/cubit/r2s_clothes_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_screen/presentation/view/arosa_devices_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_shoes_screen/presentation/view/arosa_devices_shoes_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_shoes_screen/presentation/view_model/cubit/shoes_clothes_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_sports_clothes_screen/presentation/view/arosa_devices_sports_clothes_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_sports_clothes_screen/presentation/view_model/cubit/sports_clothes_cubit.dart';
import 'package:zaghrota_app/features/arosa_devices_unformal_clothes_screen/presentation/view/arosa_devices_unformal_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_unformal_clothes_screen/presentation/view_model/cubit/unformal_clothes_cubit.dart';
import 'package:zaghrota_app/features/badla_screen/data/model/badla_model.dart';
import 'package:zaghrota_app/features/badla_screen/presentation/view/badla_screen.dart';
import 'package:zaghrota_app/features/badla_screen/presentation/view_model/cubit/badla_screen_cubit.dart';
import 'package:zaghrota_app/features/default_screen/default_screen.dart';
import 'package:zaghrota_app/features/do5la_ad3ya_screen/presentation/view/do3a2_screen.dart';
import 'package:zaghrota_app/features/do5la_ad3ya_screen/presentation/view/e8tsal_do3a2_screen.dart';
import 'package:zaghrota_app/features/do5la_ad3ya_screen/presentation/view/gema3_do3a2_screen.dart';
import 'package:zaghrota_app/features/do5la_ad3ya_screen/presentation/view/mo3asharaj_do3a2_screen.dart';
import 'package:zaghrota_app/features/do5la_ad3ya_screen/presentation/view/neya_do3a2_screen.dart';
import 'package:zaghrota_app/features/do5la_ad3ya_screen/presentation/view/sala_do3a2.dart';
import 'package:zaghrota_app/features/do5la_screens/presentation/view/do5la_screen.dart';
import 'package:zaghrota_app/features/dress_screen/presentation/view/dress_screen.dart';
import 'package:zaghrota_app/features/dress_screen/presentation/view_model/cubit/dress_screen_cubit.dart';
import 'package:zaghrota_app/features/fatha_ma3azzem_screen/presentation/view/fatha_ma3aazeem_invited_people_screen.dart';
import 'package:zaghrota_app/features/fatha_ma3azzem_screen/presentation/view_model/cubit/fatha_invited_people_screen_cubit.dart';
import 'package:zaghrota_app/features/fatha_screen/presentation/view/fatha_screen.dart';
import 'package:zaghrota_app/features/fatha_songs_screen/presentation/view/fatha_songs_screen.dart';
import 'package:zaghrota_app/features/fatha_songs_screen/presentation/view_model/cubit/fatha_songs_screen_cubit.dart';
import 'package:zaghrota_app/features/fatha_wedding_notes_screen/presentation/view/fatha_notes_screen.dart';
import 'package:zaghrota_app/features/fatha_wedding_notes_screen/presentation/view_model/cubit/fatha_notes_screen_cubit.dart';
import 'package:zaghrota_app/features/hena_notes_screen/presentation/view/hena_notes_screen.dart';
import 'package:zaghrota_app/features/hena_notes_screen/presentation/view_model/cubit/hena_notes_screen_cubit.dart';
import 'package:zaghrota_app/features/hena_screen/presentation/view/hena_screen.dart';
import 'package:zaghrota_app/features/hena_songs_screen/presentation/view/hena_songs_screen.dart';
import 'package:zaghrota_app/features/hena_songs_screen/presentation/view_model/cubit/hena_songs_cubit.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/home_screen.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view_model/cubit/home_screen_cubit.dart';
import 'package:zaghrota_app/features/invited_people_hena_screen/presentation/view/invited_people_hena_screen.dart';
import 'package:zaghrota_app/features/invited_people_hena_screen/presentation/view_model/cubit/invited_people_hena_screen_cubit.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/invited_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view/invited_people_screeen.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view_model/cubit/invited_people_cubit.dart';
import 'package:zaghrota_app/features/invited_people_shabka_screen/presentation/view/invited_people_shabka_screen.dart';
import 'package:zaghrota_app/features/invited_people_shabka_screen/presentation/view_model/cubit/invited_people_screen_shabka_cubit.dart';
import 'package:zaghrota_app/features/login_screen/data/farah_model.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/login_screen.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view_model/cubit/farah_data_cubit.dart';
import 'package:zaghrota_app/features/mohafzat_screen/presentation/view/mohafzat_screen.dart';
import 'package:zaghrota_app/features/mohafzat_screen/presentation/view_model/cubit/get_mohafza_cubit.dart';
import 'package:zaghrota_app/features/note_detail_screen/presentation/view/note_details_screen.dart';
import 'package:zaghrota_app/features/session_screen/presentation/view/session_screen.dart';
import 'package:zaghrota_app/features/session_screen/presentation/view_model/cubit/session_screen_cubit.dart';
import 'package:zaghrota_app/features/shabka_notes_screen/presentation/view/shabka_notes_screen.dart';
import 'package:zaghrota_app/features/shabka_notes_screen/presentation/view_model/cubit/shabka_notes_screen_cubit.dart';
import 'package:zaghrota_app/features/shabka_screen/presentation/view/shabka_screen.dart';
import 'package:zaghrota_app/features/shabka_songs_screen/presentation/view/shabka_songs_screen.dart';
import 'package:zaghrota_app/features/shabka_songs_screen/presentation/view_model/cubit/shabka_songs_screen_cubit.dart';
import 'package:zaghrota_app/features/songs_screen/data/models/song_model.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/songs_screen.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view_model/cubit/farah_songs_screen_cubit.dart';
import 'package:zaghrota_app/features/splash_screen/presentation/view/splash_screen.dart';
import 'package:zaghrota_app/features/wedding_items_screen/presentation/view/wedding_items_screen.dart';
import 'package:zaghrota_app/features/wedding_notes_screen/data/model/note_model.dart';
import 'package:zaghrota_app/features/wedding_notes_screen/presentation/view/wedding_notes_screen.dart';
import 'package:zaghrota_app/features/wedding_notes_screen/presentation/view_model/cubit/wedding_notes_screen_cubit.dart';
import 'package:zaghrota_app/features/wedding_preprations_screen/presentation/view/wedding_preprations_screen.dart';
import 'package:zaghrota_app/features/zafa_screen/presentation/view/zafa_screen.dart';
import 'package:zaghrota_app/features/zafa_screen/presentation/view_model/cubit/zafa_images_cubit.dart';
import 'package:zaghrota_app/generated/l10n.dart';
import 'package:zaghrota_app/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await NotificationService.init();
  await Hive.initFlutter();
  await SharedPrefrenceHelper.initSharedpref();
  MobileAds.instance.initialize();

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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: MaterialApp(
        locale: const Locale("ar"),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          if (settings.name == ScreenNames.advertisementScreen) {
            final args = settings.arguments as Map<String, dynamic>;

            // Create the AdvertisementScreen with the provided arguments.
            return MaterialPageRoute(
              builder: (context) {
                return AdvertisementScreen(
                  height: args['height'],
                  width: args['width'],
                  imagePath: args['imagePath'],
                  pageSentence: args['pageSentence'],
                  pageName: args["pageName"],
                );
              },
            );
          } else if (settings.name == ScreenNames.noteDetails) {
            final args = settings.arguments as Map<String, dynamic>;

            return MaterialPageRoute(
              builder: (context) {
                return NoteDetailsScreen(
                  title: args["title"],
                  content: args["content"],
                );
              },
            );
          }
          return null;
        },
        routes: {
          ScreenNames.loginScreen: (context) => BlocProvider(
                create: (context) => FarahDataCubit(),
                child: const LoginScreen(),
              ),
          ScreenNames.homeScreen: (context) => BlocProvider(
                create: (context) => HomeScreenCubit()..getdata(),
                child: const HomeScreen(),
              ),
          ScreenNames.weddingItemsScreen: (context) =>
              const WeddingItemsScreen(),
          ScreenNames.weddingPreprationsScreen: (context) =>
              const WeddingPreprationsScreen(),
          ScreenNames.defaultScreen: (context) => const DefaultScreen(),
          ScreenNames.songsScreen: (context) => BlocProvider(
                create: (context) => FarahSongsScreenCubit()..getSongs(),
                child: const SongsScreen(),
              ),
          ScreenNames.invitedPeopleScreen: (context) => BlocProvider(
                create: (context) => InvitedPeopleCubit()..getInvitedPeople(),
                child: const InvitedPeopleScreen(),
              ),
          ScreenNames.bdlaScreen: (context) => BlocProvider(
                create: (context) => BadlaScreenCubit()..getBadlaItems(),
                child: const BadlaScreen(),
              ),
          ScreenNames.dressScreen: (context) => BlocProvider(
                create: (context) => DressScreenCubit()..getCheckedData(),
                child: const DressScreen(),
              ),
          ScreenNames.arosaDevicesScreen: (context) =>
              const ArosaDevicesScreen(),
          ScreenNames.sessionScreen: (context) => BlocProvider(
                create: (context) => SessionScreenCubit()..getCheckedData(),
                child: const SessionScreen(),
              ),
          ScreenNames.henaScreen: (context) => const HenaScreen(),
          ScreenNames.mohafzatScreen: (context) => BlocProvider(
                create: (context) => GetMohafzaCubit()..getMohafzat(),
                child: const MohafzatScreen(),
              ),
          ScreenNames.invitedPeopleHenaScreen: (context) => BlocProvider(
                create: (context) =>
                    InvitedPeopleHenaScreenCubit()..getInvitedPeople(),
                child: const InvitedPeopleHenaScreen(),
              ),
          ScreenNames.shabkaScreen: (context) => const ShabkaScreen(),
          ScreenNames.invitedPeopleShabkaScreen: (context) => BlocProvider(
                create: (context) =>
                    InvitedPeopleScreenShabkaCubit()..getInvitedPeople(),
                child: const InvitedPeopleShabkaScreen(),
              ),
          ScreenNames.fathacreen: (context) => const FathaScreen(),
          ScreenNames.henaSongsScreen: (context) => BlocProvider(
                create: (context) => HenaSongsCubit()..getSongs(),
                child: const HenaSongsScreen(),
              ),
          ScreenNames.shabkaSongsScreen: (context) => BlocProvider(
                create: (context) => ShabkaSongsScreenCubit()..getSongs(),
                child: const ShabkaSongsScreen(),
              ),
          ScreenNames.fathaSongsScreen: (context) => BlocProvider(
                create: (context) => FathaSongsScreenCubit()..getSongs(),
                child: const FathaSongsScreen(),
              ),
          ScreenNames.arosaDevicesBathScreen: (context) => BlocProvider(
                create: (context) => DevicesBathScreenCubit()..getData(),
                child: const ArosaDevicesBathScreen(),
              ),
          ScreenNames.arosaDevicesKitchenScreen: (context) => BlocProvider(
                create: (context) => DevicesKitchenScreenCubit()..getDaata(),
                child: const ArosaDevicesKitchenScreen(),
              ),
          ScreenNames.arosaDevicesMafroshatScreen: (context) => BlocProvider(
                create: (context) => DevicesMafroshaatScreenCubit()..getDaata(),
                child: const ArosaDevicesMafroshaatScreen(),
              ),
          ScreenNames.arosaDevicesHoneymonthScreen: (context) => BlocProvider(
                create: (context) => DevicesHoneyMonthScreenCubit()..getDaata(),
                child: const ArosaDevicesHonemonthScreen(),
              ),
          ScreenNames.arosaDevicesElectroScreen: (context) => BlocProvider(
                create: (context) =>
                    DevicesElectronicsScreenCubit()..getDaata(),
                child: const ArosaDevicesElectronicsScreen(),
              ),
          ScreenNames.invitedPeopleFathaScreen: (context) => BlocProvider(
                create: (context) =>
                    FathaInvitedPeopleScreenCubit()..getInvitedPeople(),
                child: const FathaMa3aazeemInvitedPeopleScreen(),
              ),
          ScreenNames.arosaDevicesClothesScreen: (context) => BlocProvider(
                create: (context) => ClothesScreenCubit()..getCheckedData(),
                child: const ArosaDevicesClothesScreen(),
              ),
          ScreenNames.do5laScreen: (context) => const Do5laScreen(),
          ScreenNames.do3a2Screen: (context) => const Do3a2Screen(),
          ScreenNames.e8tsaldo3a2Screen: (context) => const E8tsalDo3a2Screen(),
          ScreenNames.gema3do3a2Screen: (context) => const Gema3Do3a2Screen(),
          ScreenNames.mo3asharahdo3a2Screen: (context) =>
              const Mo3asharajDo3a2Screen(),
          ScreenNames.neyado3a2Screen: (context) => const NeyaDo3a2Screen(),
          ScreenNames.salado3a2Screen: (context) => const SalaDo3a2Screen(),
          ScreenNames.arosaDevicesDailyClothesScreen: (context) => BlocProvider(
                create: (context) => DevicesDailyClothesCubit()..getDaata(),
                child: const ArosaDevicesClothesDailyScreen(),
              ),
          ScreenNames.arosaDevicesNoomClothesScreen: (context) => BlocProvider(
                create: (context) => NoomClothesCubit()..getDaata(),
                child: const ArosaDevicesNoomClothesScreen(),
              ),
          ScreenNames.arosaDevicesHomeClothesScreen: (context) => BlocProvider(
                create: (context) => HomeOccClothesCubit()..getDaata(),
                child: const ArosaDevicesHomeOccScreen(),
              ),
          ScreenNames.arosaDevicesCentianClothesScreen: (context) =>
              BlocProvider(
                create: (context) => CentainClothesCubit()..getDaata(),
                child: const ArosaDevicesCentianScreen(),
              ),
          ScreenNames.arosaDevicesFormalClothesScreen: (context) =>
              BlocProvider(
                create: (context) => FormalClothesCubit()..getDaata(),
                child: const ArosaDevicesFormalClothesScreen(),
              ),
          ScreenNames.arosaDevicesSportsClothesScreen: (context) =>
              BlocProvider(
                create: (context) => SportsClothesCubit()..getDaata(),
                child: const ArosaDevicesSportsClothesScreen(),
              ),
          ScreenNames.arosaDevicesHarirClothesScreen: (context) => BlocProvider(
                create: (context) => HarirClothesCubit()..getDaata(),
                child: const ArosaDevicesHarirClothesScreen(),
              ),
          ScreenNames.arosaDevicesUnFormalClothesScreen: (context) =>
              BlocProvider(
                create: (context) => UnformalClothesCubit()..getDaata(),
                child: const ArosaDevicesUnformalScreen(),
              ),
          ScreenNames.arosaDevicesAccessoriesScreen: (context) => BlocProvider(
                create: (context) => AccessoriesCubit()..getDaata(),
                child: const ArosaDevicesAccessoriesScreen(),
              ),
          ScreenNames.arosaDevicesShoesScreen: (context) => BlocProvider(
                create: (context) => ShoesClothesCubit()..getDaata(),
                child: const ArosaDevicesShoesScreen(),
              ),
          ScreenNames.arosaDevicesR2sScreen: (context) => BlocProvider(
                create: (context) => R2sClothesCubit()..getDaata(),
                child: const ArosaDevicesR2sScreen(),
              ),
          ScreenNames.weddingNotesScreen: (context) => BlocProvider(
                create: (context) => WeddingNotesScreenCubit()..getdata(),
                child: const WeddingNotesScreen(),
              ),
          ScreenNames.fathaNotesScreen: (context) => BlocProvider(
                create: (context) => FathaNotesScreenCubit()..getdata(),
                child: const FathaNotesScreen(),
              ),
          ScreenNames.henaNotesScreen: (context) => BlocProvider(
                create: (context) => HenaNotesScreenCubit()..getdata(),
                child: const HenaNotesScreen(),
              ),
          ScreenNames.shabkaNotesScreen: (context) => BlocProvider(
                create: (context) => ShabkaNotesScreenCubit()..getdata(),
                child: const ShabkaNotesScreen(),
              ),
          ScreenNames.appointmentScreen: (context) => const AppointmentScreen(),
          ScreenNames.zafaScreen: (context) =>  BlocProvider(
                create: (context) => ZafaImagesCubit()..getImages(),
                child: const ZafaScreen(),
              ),
          ScreenNames.splashScreen:(context)=> const SplashScreen()
        },
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        initialRoute:ScreenNames.splashScreen
            // SharedPrefrenceHelper.sharedPreferences!.getString("hash") == null
            //     ? ScreenNames.loginScreen
            //     : ScreenNames.homeScreen,
      ),
    );
  }
}
