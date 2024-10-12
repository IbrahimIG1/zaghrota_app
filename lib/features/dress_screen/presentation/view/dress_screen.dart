import 'package:flutter/material.dart';
import 'package:zaghrota_app/features/dress_screen/presentation/view/widgets/dress_screen_gridview_builder.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class DressScreen extends StatelessWidget {
  const DressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: DressScreenGridviewBuilder()
      ),
    );
  }
}
