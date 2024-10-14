import 'package:flutter/material.dart';
import 'package:zaghrota_app/features/arosa_devices_screen/presentation/view/widgets/arosa_devices_gridview.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class ArosaDevicesScreen extends StatelessWidget {
  const ArosaDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return const SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: ArosaDevicesGridview()
        ),
      ),
    );
  }
}