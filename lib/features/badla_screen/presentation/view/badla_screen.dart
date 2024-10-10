import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaghrota_app/features/badla_screen/presentation/view/widgets/badla_screen_floating_button.dart';
import 'package:zaghrota_app/features/badla_screen/presentation/view/widgets/badla_screen_listview.dart';
import 'package:zaghrota_app/features/badla_screen/presentation/view_model/cubit/badla_screen_cubit.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class BadlaScreen extends StatelessWidget {
  const BadlaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocConsumer<BadlaScreenCubit, BadlaScreenState>(
        listener: (context, state) {
      
        },
        builder: (context, state) {
          var cubit = BadlaScreenCubit.get(context);
          return BadlaScreenFloatingButton(
             namecontroller:cubit.controlName ,
              formKey:cubit.formKey , 
               addData:() {
                  cubit.addBadlaItem();
               }, 
              
              );
        },
      ),
      appBar: const CustomAppBar(),
      body: const SingleChildScrollView(
        child: BadlaScreenListview(),
      ),
    );
  }
}
