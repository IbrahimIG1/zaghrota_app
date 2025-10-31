import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zaghrota_app/core/dio_helper/dio_error_handler.dart';
import 'package:zaghrota_app/core/shared_prefrence_helper/shared_prefrences_helper.dart';
import 'package:zaghrota_app/features/appointment_view_screen/data/model/note_api_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';
import 'package:zaghrota_app/notification_service.dart';

class AppointmentViewRepo {
  Future<Either<ErrorModel,void>> addApointment({
    required String date,
    required String title,
    required String content,
    required String type
  })async{
    try{
       await Dio().post("https://leilatelomr.aiotgroups.com/api/calendars",
      data: {
         "date": date,
        "title": title,
        "content": content,
        "hash": SharedPrefrenceHelper.sharedPreferences!.getString("hash"),
        "type": type
      });
      //  await NotificationService.schduledNotification(id: 0,date: DateTime.parse(date),title: type,body: title);
      // log("added successsssfulllly");
      return right(null);
    }
    on DioException catch (e){
      // log("added error");
    if(e.response!=null){
   return left(ErrorModel(errormsg: e.response.toString()));
     
    }
    
    else{
      // log("added error");
   String error = DioExceptionHandler.handleDioError(e);
   return left(ErrorModel(errormsg: error));

    }

  }

  catch(e){
   return left(ErrorModel(errormsg: e.toString()));
  }
  }

   Future<Either<ErrorModel,List<NotaApiModel>>> getData({required String type})async{
    try{
       var response = await Dio().get("https://leilatelomr.aiotgroups.com//api/calendars",
       data:{
        "hash": SharedPrefrenceHelper.sharedPreferences!.getString("hash"),
        "type": type
       } );
      //  log(response.data["content"].toString());

       List<NotaApiModel> data = [];
       for(var x in response.data){
        data.add(NotaApiModel.fromJson(x));
       }
       return right(data);
    }
   on DioException catch (e){
      log("added error");
    if(e.response!=null){
   return left(ErrorModel(errormsg: e.response.toString()));
     
    }
    
    else{
      log("added error");
   String error = DioExceptionHandler.handleDioError(e);
   return left(ErrorModel(errormsg: error));

    }

  }

  catch(e){
   return left(ErrorModel(errormsg: e.toString()));
  }
   }


   Future<Either<ErrorModel,void>> deleteNote({required String noteId})async{
    try{
     await Dio().delete("https://leilatelomr.aiotgroups.com/api/calendars/$noteId");
     return right(null);
    }
    on DioException catch (e){
      log("added error");
    if(e.response!=null){
   return left(ErrorModel(errormsg: e.response.toString()));
     
    }
    
    else{
      log("added error");
   String error = DioExceptionHandler.handleDioError(e);
   return left(ErrorModel(errormsg: error));

    }

  }

  catch(e){
   return left(ErrorModel(errormsg: e.toString()));
  }

   }
}