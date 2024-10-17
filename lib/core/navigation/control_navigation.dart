import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';

class ControlNavigation {
  static void navigationToController({required String pageName,
  required BuildContext context,
  dynamic arguments
  }){
    switch (pageName) {
      case ScreenNames.loginScreen:
       Navigator.pushNamed(context, pageName);
        break;
      case ScreenNames.homeScreen:
      Navigator.pushNamed(context, pageName,arguments:arguments );
      break;
      case ScreenNames.weddingItemsScreen:
       Navigator.pushNamed(context, pageName,arguments: arguments);
        break;
       case ScreenNames.weddingPreprationsScreen:
       Navigator.pushNamed(context, pageName,arguments: arguments);
        break;
        case ScreenNames.songsScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.invitedPeopleScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.advertisementScreen:
        Navigator.pushNamed(context, pageName,arguments: arguments);
        break;
        case ScreenNames.bdlaScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.dressScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.arosaDevicesScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.sessionScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.henaScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.mohafzatScreen:
        Navigator.pushNamed(context, pageName);
        break;
         case ScreenNames.ka3atScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.invitedPeopleHenaScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.shabkaScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.invitedPeopleShabkaScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.fathacreen:
        Navigator.pushNamed(context, pageName);
        break;
         case ScreenNames.henaSongsScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.shabkaSongsScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.fathaSongsScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.arosaDevicesBathScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.arosaDevicesKitchenScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.arosaDevicesMafroshatScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.arosaDevicesHoneymonthScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.arosaDevicesElectroScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.modnScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.invitedPeopleFathaScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.arosaDevicesClothesScreen:
        Navigator.pushNamed(context, pageName);
        break;
        case ScreenNames.do5laScreen:
        Navigator.pushNamed(context, pageName);
        break;
        
      default:
       Navigator.pushNamed(context, ScreenNames.defaultScreen,);

    }

  }
}