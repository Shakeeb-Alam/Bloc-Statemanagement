
























// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:blocstate/domain/color_model.dart';
//
// class ColorRepository {
//   final SharedPreferences _prefs;
//
//   ColorRepository(this._prefs);
//
//   Future<void> saveColors(List<Notes> colors) async {
//     final jsonData = jsonEncode(colors.map((color) => color.toJson()).toList());
//     await _prefs.setString('colors', jsonData);
//   }
//
//   Future<List<Notes>> getColors() async {
//     final jsonData = _prefs.getString('colors');
//     if (jsonData != null) {
//       final List<dynamic> parsedJson = jsonDecode(jsonData);
//       return parsedJson.map((json) => Notes.fromJson(json)).toList();
//     }
//     return [];
//   }
// }