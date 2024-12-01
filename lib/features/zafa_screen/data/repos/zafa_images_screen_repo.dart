import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zaghrota_app/core/dio_helper/dio_error_handler.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';
import 'package:zaghrota_app/features/zafa_screen/data/model/zafa_image_model.dart';

class ZafaImagesScreenRepo {
      Future<Either<ErrorModel,List<ZafaImageModel>>> getImages()async{

 try{
  var response = await Dio().get("https://leilatelomr.aiotgroups.com/api/cardecorations");

  List<ZafaImageModel> data = [];
  for (var x in response.data){
    data.add(ZafaImageModel.fromJson(x));
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
