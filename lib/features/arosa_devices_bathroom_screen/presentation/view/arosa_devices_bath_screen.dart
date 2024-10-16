import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/presentation/view/widgets/custom_list_view.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/presentation/view/widgets/floating_add_button.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/presentation/view_model/cubit/devices_bath_screen_cubit.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_text_field.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class ArosaDevicesBathScreen extends StatelessWidget {
  const ArosaDevicesBathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.scaffoldColor,
            floatingActionButton: BlocConsumer<DevicesBathScreenCubit, DevicesBathScreenState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
        var cubit = DevicesBathScreenCubit.get(context);

                return AddDataDeviceDialogue(
                    namecontroller: cubit.devicenamecont,
                    numbercontroller: cubit.numbercont,
                    formKey: cubit.formKey,
                    onChanged: (x) {},
                    addData: () {
                      cubit.addData();
                    });
              },
            ),
            appBar: const CustomAppBar(),
            body: SingleChildScrollView(
              child: BlocConsumer<DevicesBathScreenCubit, DevicesBathScreenState>(
                listener: (context, state) {
                 
                },
                builder: (context, state) {
                  var cubit = DevicesBathScreenCubit.get(context);
                if(state is DevicesBathScreenSuccess){
                  return CustomListView(
                    numberOnPressed: (index) {
                      String? newval;
                      updateDialog(context, newval, state, index, cubit);
                    },
                              deleteOnPressed: (p0) {
                                deleteDialog(context, cubit, p0);
                              },
                              checkOnChanged: (p0, p1) {
                                state.bathDevices[p1].checked = p0!;
                                cubit.updateCheck(
                                    index: p1,
                                    model: DevicesModel(
                                        deviceName: state.bathDevices[p1].deviceName,
                                        number: state.bathDevices[p1].number,
                                        checked: state.bathDevices[p1].checked));
                              },
                              data: state.bathDevices,
                            );}
                        else if(state is DevicesBathScreenFailure){
                                  return Center(
              child: Text("State is ${state.errormsg}"),
            );
                        }
                
                else{
                     return const Center(
              child: CircularProgressIndicator(
                color: AppColors.circleAvatarBorderColor,
              ),
            );
                }
                },
              ),
            ),
          )
        
      );  }


Future<void> updateDialog(BuildContext context, String? newval, DevicesBathScreenSuccess state, int index, DevicesBathScreenCubit cubit) {
    return showDialog(context: context, builder: (context) => AlertDialog(
                backgroundColor: AppColors.scaffoldColor,
                title: Center(child: Text("تعديل الرقم",style: Textstyles.nameOfInvitedPeopleStyle)),
                content: Column(
                  mainAxisSize:  MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Customtextfield(  
                      onChanged: (p0) {
                        newval=p0;
                      },                       
                          hintText: "عدد القطع",
                          useStyle2: false,
                          keyboardType: TextInputType.number,
                        ),
                        const VerticalSizedBox(height: 10),
                           ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    AppColors.circleAvatarBorderColor),
                            onPressed: ()  {
                             if(newval!=null){
                              state.bathDevices[index].number = newval!;
                              cubit.updateCheck(
                                  index: index,
                                  model: DevicesModel(
                                      deviceName: state.bathDevices[index].deviceName,
                                      number: state.bathDevices[index].number,
                                      checked: state.bathDevices[index].checked));
                                      Navigator.pop(context);
                             }
                             else{
                              Navigator.pop(context);
                             }
                            },
                            child: Text(
                              "اضافة",
                              style: Textstyles.songsTopTitleStyle,
                            ))
                  ],
                ),
              ),);
              }

       void deleteDialog(BuildContext context, DevicesBathScreenCubit cubit, int index) {
            showDialog(context: context, builder: (context) => AlertDialog(
          title: Center(child: Text("تأكيد الحذف",style: Textstyles.nameOfInvitedPeopleStyle,)),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
            SizedBox(
              width: 0.5.sw,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green
                ),
                onPressed: () {
                  cubit.deleteItem(index: index);
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                 child: Text("نعم",style: Textstyles.songsTopTitleStyle,)),
            ),
          const VerticalSizedBox(height: 1),
          SizedBox(
            width: 0.5.sw,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red
                ),
                onPressed: () {
              Navigator.pop(context);
            }, child: Text("لا",style: Textstyles.songsTopTitleStyle,)),
          )
          
          ],),
        ),);
  }
}
