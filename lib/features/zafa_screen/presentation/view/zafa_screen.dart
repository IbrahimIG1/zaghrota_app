import 'package:flutter/material.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';
import 'package:zaghrota_app/features/zafa_screen/presentation/view/widgets/zafa_gridview.dart';

class ZafaScreen extends StatelessWidget {
  const ZafaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: CustomAppBar(),
      body:ZafaGridview() ,
    ));
  }
}