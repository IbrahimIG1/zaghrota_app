import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/app_Themes/app_theme.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/features/advertisement_screen/presentation/view/advertisement_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/presentation/view/arosa_devices_bath_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_screen/presentation/view/arosa_devices_screen.dart';
import 'package:zaghrota_app/features/badla_screen/data/model/badla_model.dart';
import 'package:zaghrota_app/features/badla_screen/presentation/view/badla_screen.dart';
import 'package:zaghrota_app/features/badla_screen/presentation/view_model/cubit/badla_screen_cubit.dart';
import 'package:zaghrota_app/features/default_screen/default_screen.dart';
import 'package:zaghrota_app/features/dress_screen/presentation/view/dress_screen.dart';
import 'package:zaghrota_app/features/dress_screen/presentation/view_model/cubit/dress_screen_cubit.dart';
import 'package:zaghrota_app/features/fatha_screen/presentation/view/fatha_screen.dart';
import 'package:zaghrota_app/features/fatha_songs_screen/presentation/view/fatha_songs_screen.dart';
import 'package:zaghrota_app/features/fatha_songs_screen/presentation/view_model/cubit/fatha_songs_screen_cubit.dart';
import 'package:zaghrota_app/features/hena_screen/presentation/view/hena_screen.dart';
import 'package:zaghrota_app/features/hena_songs_screen/presentation/view/hena_songs_screen.dart';
import 'package:zaghrota_app/features/hena_songs_screen/presentation/view_model/cubit/hena_songs_cubit.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/home_screen.dart';
import 'package:zaghrota_app/features/invited_people_hena_screen/presentation/view/invited_people_hena_screen.dart';
import 'package:zaghrota_app/features/invited_people_hena_screen/presentation/view_model/cubit/invited_people_hena_screen_cubit.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/invited_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view/invited_people_screeen.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view_model/cubit/invited_people_cubit.dart';
import 'package:zaghrota_app/features/invited_people_shabka_screen/presentation/view/invited_people_shabka_screen.dart';
import 'package:zaghrota_app/features/invited_people_shabka_screen/presentation/view_model/cubit/invited_people_screen_shabka_cubit.dart';
import 'package:zaghrota_app/features/ka3at_screen/presentation/view/ka3at_screen.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/login_screen.dart';
import 'package:zaghrota_app/features/mohafzat_screen/presentation/view/mohafzat_screen.dart';
import 'package:zaghrota_app/features/session_screen/presentation/view/session_screen.dart';
import 'package:zaghrota_app/features/session_screen/presentation/view_model/cubit/session_screen_cubit.dart';
import 'package:zaghrota_app/features/shabka_screen/presentation/view/shabka_screen.dart';
import 'package:zaghrota_app/features/shabka_songs_screen/presentation/view/shabka_songs_screen.dart';
import 'package:zaghrota_app/features/shabka_songs_screen/presentation/view_model/cubit/shabka_songs_screen_cubit.dart';
import 'package:zaghrota_app/features/songs_screen/data/models/song_model.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/songs_screen.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view_model/cubit/farah_songs_screen_cubit.dart';
import 'package:zaghrota_app/features/wedding_items_screen/presentation/view/wedding_items_screen.dart';
import 'package:zaghrota_app/features/wedding_preprations_screen/presentation/view/wedding_preprations_screen.dart';
import 'package:zaghrota_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  Hive.registerAdapter(InvitedModelAdapter());
  Hive.registerAdapter(BadlaModelAdapter());
  Hive.registerAdapter(SongModelAdapter());

  await Hive.openBox<InvitedModel>(BoxesNames.invitedPeoples);
  await Hive.openBox<InvitedModel>(BoxesNames.invitedPeopleHena);
  await Hive.openBox<InvitedModel>(BoxesNames.invitedPeopleShabka);
  await Hive.openBox<BadlaModel>(BoxesNames.badlaitems);
  await Hive.openBox<bool>(BoxesNames.dressChecks);
  await Hive.openBox<bool>(BoxesNames.sessionChecks);
  await Hive.openBox<SongModel>(BoxesNames.songsFarah);
  await Hive.openBox<SongModel>(BoxesNames.songshena);
  await Hive.openBox<SongModel>(BoxesNames.songsShabka);
  await Hive.openBox<SongModel>(BoxesNames.songsFatha);
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
          }
          return null;
        },
        routes: {
          ScreenNames.loginScreen: (context) => const LoginScreen(),
          ScreenNames.homeScreen: (context) => const HomeScreen(),
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
          ScreenNames.mohafzatScreen: (context) => const MohafzatScreen(),
          ScreenNames.ka3atScreen: (context) => const Ka3atScreen(),
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
          ScreenNames.fathaSongsScreen: (context) =>  BlocProvider(
                create: (context) => FathaSongsScreenCubit()..getSongs(),
                child: const FathaSongsScreen(),
              ),
          ScreenNames.arosaDevicesBathScreen:(context)=>const ArosaDevicesBathScreen()
        },
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        initialRoute: ScreenNames.loginScreen,
      ),
    );
  }
}
