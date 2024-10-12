import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/app_Themes/app_theme.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/features/advertisement_screen/presentation/view/advertisement_screen.dart';
import 'package:zaghrota_app/features/arosa_devices_screen/presentation/view/arosa_devices_screen.dart';
import 'package:zaghrota_app/features/badla_screen/data/model/badla_model.dart';
import 'package:zaghrota_app/features/badla_screen/presentation/view/badla_screen.dart';
import 'package:zaghrota_app/features/badla_screen/presentation/view_model/cubit/badla_screen_cubit.dart';
import 'package:zaghrota_app/features/default_screen/default_screen.dart';
import 'package:zaghrota_app/features/dress_screen/presentation/view/dress_screen.dart';
import 'package:zaghrota_app/features/dress_screen/presentation/view_model/cubit/dress_screen_cubit.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/home_screen.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/invited_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view/invited_people_screeen.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view_model/cubit/invited_people_cubit.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/login_screen.dart';
import 'package:zaghrota_app/features/session_screen/presentation/view/session_screen.dart';
import 'package:zaghrota_app/features/session_screen/presentation/view_model/cubit/session_screen_cubit.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/songs_screen.dart';
import 'package:zaghrota_app/features/wedding_items_screen/presentation/view/wedding_items_screen.dart';
import 'package:zaghrota_app/features/wedding_preprations_screen/presentation/view/wedding_preprations_screen.dart';
import 'package:zaghrota_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  Hive.registerAdapter(InvitedModelAdapter());
  Hive.registerAdapter(BadlaModelAdapter());

  await Hive.openBox<InvitedModel>(BoxesNames.invitedPeoples);
  await Hive.openBox<BadlaModel>(BoxesNames.badlaitems);
  await Hive.openBox<bool>(BoxesNames.dressChecks);
  await Hive.openBox<bool>(BoxesNames.sessionChecks);
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
          ScreenNames.songsScreen: (context) => const SongsScreen(),
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
              )
        },
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        initialRoute: ScreenNames.loginScreen,
      ),
    );
  }
}
