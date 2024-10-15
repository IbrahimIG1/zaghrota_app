import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/presentation/view/widgets/custom_list_view.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/presentation/view/widgets/floating_add_button.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/presentation/view_model/cubit/devices_bath_screen_cubit.dart';
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
                              deleteOnPressed: (p0) {
                                cubit.deleteItem(index: p0);
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
}
