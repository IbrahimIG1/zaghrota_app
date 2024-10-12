import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';

class ControlNavigation {
  navigationToController({required String pageName,
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
      default:
       Navigator.pushNamed(context, ScreenNames.defaultScreen,);

    }

  }
}