import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zaghrota_app/core/dio_helper/dio_error_handler.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';
import 'package:zaghrota_app/features/mohafzat_screen/data/model/mohafza_model.dart';

class MohafzatScreenRepo {

  Future<Either<ErrorModel,List<MohafzaModel>>> getMohafzat()async{
  
   try{
    var response = await Dio().get("https://leilatelomr.aiotgroups.com/api/provinces");
    List<MohafzaModel> data = [];
    for (var x in response.data){
     data.add(MohafzaModel.fromJson(x));
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