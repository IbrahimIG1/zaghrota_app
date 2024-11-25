import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/features/appointment_view_screen/presentation/view_model/cubit/appointments_cubit.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';
import 'package:zaghrota_app/features/wedding_notes_screen/presentation/view/widgets/add_button_note.dart';
import 'package:zaghrota_app/features/wedding_notes_screen/presentation/view/widgets/wedding_notes_listview.dart';

class AppointmentViewScreen extends StatelessWidget {
  const AppointmentViewScreen({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: const CustomAppBar(),
      floatingActionButton: BlocConsumer<AppointmentsCubit, AppointmentsState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppointmentsCubit cubit = AppointmentsCubit.get(context);
          return AddNoteDataDialogue(
              contentNotecontroller: cubit.descCont,
              dateNotecontroller: cubit.dateCont,
              titleNotecontroller: cubit.titleCont,
              formKey: cubit.keey,
              onChanged: (p0) {},
              addData: () {
                cubit.adddata(type: type);
              });
        },
      ),
      body: BlocConsumer<AppointmentsCubit, AppointmentsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          AppointmentsCubit cubit = AppointmentsCubit.get(context);
          // AppointmentsCubit cubit = AppointmentsCubit.get(context);
          if(state is GetAppointmentsSuccess){
          return state.notes.isEmpty?Center(child: Text("لم تقم باضافة تاريخ بعد...",style: Textstyles.advertisementStyle,),):
             WeddingNotesListview(
                    onDeletePressed: (p0) {
                      cubit.deletedata(noteId: state.notes[p0].sId!, type: type);
                    },
                    data:state.notes)
            
          ;
        }
        else if(state is AppointmentsFailure){
          return Center(child: Text(state.errorMsg),);
        }
        else{
          return const Center(child: CircularProgressIndicator(color: AppColors.circleAvatarBorderColor,),);
        }
        },
      ),
    ));
  }
}
