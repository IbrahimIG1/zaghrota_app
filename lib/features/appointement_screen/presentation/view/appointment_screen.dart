import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/appointement_screen/presentation/view/widgets/appointment_gridview.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(child: Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.scaffoldColor,
      body: Center(child: AppointmentGridview())
    ));
  }
}