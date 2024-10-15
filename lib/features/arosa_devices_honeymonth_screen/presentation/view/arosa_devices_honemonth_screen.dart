import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/presentation/view/widgets/custom_list_view.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class ArosaDevicesHonemonthScreen extends StatelessWidget {
  const ArosaDevicesHonemonthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
          appBar: const CustomAppBar(),
          body: SingleChildScrollView(
            child: CustomListView(
             deleteOnPressed:  (index){
   
              },
            ),
          ),
    ));
  }
}