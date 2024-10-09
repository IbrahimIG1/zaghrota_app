import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view/widgets/dialogs/floating_add_button.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view/widgets/invited_people_appbar.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view/widgets/invited_people_listvieew.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view_model/cubit/invited_people_cubit.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/songs_top_titles_item_view.dart';

class InvitedPeopleScreen extends StatelessWidget {
  const InvitedPeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton:
          BlocConsumer<InvitedPeopleCubit, InvitedPeopleState>(
        listener: (context, state) {},
        builder: (context, state) {
          InvitedPeopleCubit cubit = InvitedPeopleCubit.get(context);
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
        child: BlocBuilder<InvitedPeopleCubit, InvitedPeopleState>(
          builder: (context, state) {
            if (state is GetInvitedPeopleSucess) {
              return InvitedPeopleAppbar(sumNum: state.numberOfComings,);
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
            InvitedPeopleListvieew()
          ],
        ),
      ),
    ));
  }
}
