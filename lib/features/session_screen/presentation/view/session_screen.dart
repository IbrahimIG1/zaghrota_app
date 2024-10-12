import 'package:flutter/material.dart';
import 'package:zaghrota_app/features/session_screen/presentation/view/widgets/session_screen_gridview.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: SessionScreenGridviewBuilder()),
    ) ;
  }
}