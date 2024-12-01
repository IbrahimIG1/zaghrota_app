import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zaghrota_app/core/dio_helper/dio_error_handler.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';
import 'package:zaghrota_app/features/mohafazat_modn_screen/data/model/madina_model.dart';

class ModnScreenRepo {
  Future<Either<ErrorModel,List<MadinaModel>>> getModn({required String mohafzaId})async{

   try{
    var response = await Dio().get("https://leilatelomr.aiotgroups.com/api/cities/province/$mohafzaId");
    List<MadinaModel> data = [];
    for(var x in response.data){
      data.add(MadinaModel.fromJson(x));
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