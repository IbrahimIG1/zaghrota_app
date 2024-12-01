import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zaghrota_app/core/dio_helper/dio_error_handler.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';
import 'package:zaghrota_app/features/ka3at_screen/data/model/ka3a_model.dart';

class Ka3atScreenRepo {
  Future<Either<ErrorModel,List<Ka3aModel>>> getKa3at({required String madinaId})async{
    try{
      var response = await Dio().get("https://leilatelomr.aiotgroups.com/api/halls/city/$madinaId");
      List<Ka3aModel> data = [];
      for (var x in response.data){
        data.add(Ka3aModel.fromJson(x));
      }
      return right(data);

    }
    on DioException catch (e){
    if(e.response!=null){
   return left(ErrorModel(errormsg: e.response.toString()));
     
    }
    
    else{
   String error = DioExceptionHandler.handleDioError(e);
   return left(ErrorModel(errormsg: error));

    }

  }

  catch(e){
   return left(ErrorModel(errormsg: e.toString()));
  }
  }
}