import 'package:flutter/material.dart';
import 'package:zaghrota_app/features/hena_screen/presentation/view/widgets/hena_listview.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class HenaScreen extends StatelessWidget {
  const HenaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: HenaItemsChoicesListview()
        ),
    );
  }
}