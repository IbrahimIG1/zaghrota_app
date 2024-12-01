
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zaghrota_app/core/dio_helper/dio_error_handler.dart';
import 'package:zaghrota_app/features/dress_images_screen/data/model/dress_image_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class DressImageScreenRepo {
    Future<Either<ErrorModel,List<DressImageModel>>> getImages({required String type})async{

 try{
  var response = await Dio().get("https://leilatelomr.aiotgroups.com/api/brides",data: {
    "description":type
  });

  List<DressImageModel> data = [];
  for (var x in response.data){
    data.add(DressImageModel.fromJson(x));
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