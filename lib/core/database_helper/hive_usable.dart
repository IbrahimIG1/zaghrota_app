
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/invited_model.dart';

class HiveStorage{
  
  Future openBoox({required String boxName})async{
    await Hive.openBox(boxName); 
  }

  Future closeBooxes({required String boxName})async{
    await Hive.close(); 
  }

  Future addValue({required String boxName,required dynamic value})async{
      if(Hive.isBoxOpen(boxName)){
      var box = Hive.box<InvitedModel>(boxName);
      await box.add(value);
      }
      else{
      Hive.openBox(boxName);
      var box = Hive.box<InvitedModel>(boxName);
      await box.add(value);

      }
      
  }

  List getBoxValues({required String boxName}){
    if(Hive.isBoxOpen(boxName)){
      var box = Hive.box<InvitedModel>(boxName);
      List data = box.values.toList() ;
      return data;  
    }
    else{
      Hive.openBox<InvitedModel>(boxName);
      var box = Hive.box<InvitedModel>(boxName);
      List data = box.values.toList();
      return data;  
    }
    }

  

 Future deleteItem({required String boxName,required dynamic index})async{
    if(Hive.isBoxOpen(boxName)){
      var box = Hive.box<InvitedModel>(boxName);
      await box.deleteAt(index);
      
    }
    else{
   var box = Hive.box<InvitedModel>(boxName);
    box.deleteAt(index);
    }
   
 
  }

  Future updateItem({required String boxName,required dynamic index,required dynamic value})async{
  if(Hive.isBoxOpen(boxName)){
    var box = Hive.box<InvitedModel>(boxName);
    await box.putAt(index,value );
  }
  else{
    Hive.openBox<InvitedModel>(boxName);
    var box = Hive.box(boxName);
    await box.putAt(index,value );
  }
   }

}