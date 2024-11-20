import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zaghrota_app/core/dio_helper/dio_error_handler.dart';
import 'package:zaghrota_app/features/badla_images_screen/data/model/badla_image_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class BadlaImagesScreenRepo {

  Future<Either<ErrorModel,List<BadlaImageModel>>> getImages({required String type})async{

 try{
  var response = await Dio().get("https://zaghrota.aiotgroups.com/api/bridegrooms/$type");

  List<BadlaImageModel> data = [];
  for (var x in response.data){
    data.add(BadlaImageModel.fromJson(x));
  }
  return right(data);
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
}