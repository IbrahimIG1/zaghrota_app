import 'package:flutter/material.dart';
import 'package:zaghrota_app/features/shabka_screen/presentation/view/widgets/shabka_listview.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class ShabkaScreen extends StatelessWidget {
  const ShabkaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: ShabkaItemsChoicesListview()
        ),
    );
  }
}