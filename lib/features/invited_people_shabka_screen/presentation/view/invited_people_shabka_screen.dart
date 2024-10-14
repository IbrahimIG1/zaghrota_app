import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/invited_people_hena_screen/presentation/view/widgets/invited_people_hena_appbar.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view/widgets/dialogs/floating_add_button.dart';
import 'package:zaghrota_app/features/invited_people_shabka_screen/presentation/view/widgets/invited_people_shabka_listview.dart';
import 'package:zaghrota_app/features/invited_people_shabka_screen/presentation/view_model/cubit/invited_people_screen_shabka_cubit.dart';
import 'package:zaghrota_app/features/invited_people_shabka_screen/presentation/view_model/cubit/invited_people_screen_shabka_state.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/songs_top_titles_item_view.dart';

class InvitedPeopleShabkaScreen extends StatelessWidget {
  const InvitedPeopleShabkaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.scaffoldColor,
      floatingActionButton:
          BlocConsumer<InvitedPeopleScreenShabkaCubit, InvitedPeopleScreenShabkaState>(
        listener: (context, state) {},
        builder: (context, state) {
          InvitedPeopleScreenShabkaCubit cubit = InvitedPeopleScreenShabkaCubit.get(context);
          return AddDataDialogue(
            namecontroller: cubit.controlName,
            numbercontroller: cubit.controlNumber,
            formKey: cubit.formKey,
            onChanged: (p0) {},
            addData: () {
              cubit.addInvitedPeople();
            },
          );
        },
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: BlocBuilder<InvitedPeopleScreenShabkaCubit, InvitedPeopleScreenShabkaState>(
          builder: (context, state) {
            if (state is GetInvitedPeopleScreenShabkaStateSucess) {
              return InvitedPeopleHenaAppbar(sumNum: state.numberOfComings,);
            }
            else{
              return const Text("");
            }
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SongsTopTitlesItemView(title: "اسم المدعو"),
                SongsTopTitlesItemView(title: "عدد التابعين"),
                SongsTopTitlesItemView(title: "تأكيد الحضور"),
              ],
            ),
            InvitedPeopleShabkaListvieew()
          ],
        ),
      ),
    ));
  }
}
