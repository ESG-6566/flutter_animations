import 'dart:convert';
import 'dart:io';

import 'package:animations_work/MyTheme.dart';



///this class is for managing user main datas
class UserData {
  static MyThemeMode currentTheme = MyThemeMode.defaultMode;

  Map toJson() => {
        'themeMode': currentTheme.toString(),
      };

  // static Future<void> saveData() async {
  //   UserData userData = UserData();
  //   String json = jsonEncode(userData);
  //   Directory supportDirectory = await getApplicationSupportDirectory();
  //   File('${supportDirectory.path}/UserData.json').writeAsStringSync(json);
  // }
}
