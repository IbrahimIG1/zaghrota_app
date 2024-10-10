
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage{
  
  Future openBoox({required String boxName,required Object datatype})async{
    await Hive.openBox(boxName); 
  }

  Future closeBooxes({required String boxName})async{
    await Hive.close(); 
  }

  Future addValue<T>({required String boxName,required T value})async{
      if(Hive.isBoxOpen(boxName)){
      var box = Hive.box<T>(boxName);
      await box.add(value);
      }
      else{
      Hive.openBox<T>(boxName);
      var box = Hive.box<T>(boxName);
      await box.add(value);

      }
      
  }

  List getBoxValues<T>({required String boxName,}){
    if(Hive.isBoxOpen(boxName)){
      var box = Hive.box<T>(boxName);
      List data = box.values.toList() ;
      return data;  
    }
    else{
      Hive.openBox<T>(boxName);
      var box = Hive.box<T>(boxName);
      List data = box.values.toList();
      return data;  
    }
    }

  

 Future deleteItem<T>({required String boxName,required dynamic index})async{
    if(Hive.isBoxOpen(boxName)){
      var box = Hive.box<T>(boxName);
      await box.deleteAt(index);
      
    }
    else{
   var box = Hive.box<T>(boxName);
    box.deleteAt(index);
    }
   
 
  }

  Future updateItem<T>({required String boxName,required dynamic index,required dynamic value})async{
  if(Hive.isBoxOpen(boxName)){
    var box = Hive.box<T>(boxName);
    await box.putAt(index,value );
  }
  else{
    Hive.openBox<T>(boxName);
    var box = Hive.box<T>(boxName);
    await box.putAt(index,value );
  }
   }

}