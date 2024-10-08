import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/app_Themes/app_theme.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/features/default_screen/default_screen.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/home_screen.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/invited_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view/invited_people_screeen.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view_model/cubit/invited_people_cubit.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/login_screen.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/songs_screen.dart';
import 'package:zaghrota_app/features/wedding_items_screen/presentation/view/wedding_items_screen.dart';
import 'package:zaghrota_app/features/wedding_preprations_screen/presentation/view/wedding_preprations_screen.dart';
import 'package:zaghrota_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  Hive.registerAdapter(InvitedModelAdapter());

  await Hive.openBox<InvitedModel>(BoxesNames.invitedPeoples);
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
        routes: {
          ScreenNames.loginScreen: (context) => const LoginScreen(),
          ScreenNames.homeScreen: (context) => const HomeScreen(),
          ScreenNames.weddingItemsScreen: (context) => const WeddingItemsScreen(),
          ScreenNames.weddingPreprationsScreen: (context) =>const WeddingPreprationsScreen(),
          ScreenNames.defaultScreen: (context) => const DefaultScreen(),
          ScreenNames.songsScreen: (context) => const SongsScreen(),
          ScreenNames.invitedPeopleScreen: (context) => BlocProvider(
                create: (context) => InvitedPeopleCubit()..getInvitedPeople(),
                child: const InvitedPeopleScreen(),
              )
        },
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        initialRoute: ScreenNames.loginScreen,
      ),
    );
  }
}
