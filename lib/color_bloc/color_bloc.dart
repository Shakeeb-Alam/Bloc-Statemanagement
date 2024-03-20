import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:blocstate/domain/color_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'color_event.dart';
import 'color_state.dart';


class ColorPickerBloc extends Bloc<ColorPickerEvent, ColorPickerState> {

  ColorPickerBloc() : super(ColorPickerState.initial()) {
    on<AddColor >(
          (event, emit) => addColor(event, emit),
    );
    on<GetData >(
          (event, emit) => getColor(event, emit),
    );
  }

  addColor(AddColor event, Emitter<ColorPickerState> emit) async{
    List<Notes> temp = [];
    temp.addAll(state.noteColor.toList());
    temp.add(event.noteColor);
    await saveColorsToPrefs(temp);
    emit(state.copyWith(noteColor: temp));
  }

  // get data to shared prefrence
  getColor(GetData event, Emitter<ColorPickerState> emit)async{
    final SharedPreferences sharedPreferences= await SharedPreferences.getInstance();  // initial Shar Prefrence
    List<String>? stringList = sharedPreferences.getStringList("list");

      if (stringList != null) {

       List<Notes> data =
            stringList.map((item) {
              return Notes.fromJson(json.decode(item));
            }).toList();  // list ke ander save karwayaa

       emit(state.copyWith(noteColor:data ));
      }

  }

  //save data to shared prefrence
  Future<void> saveColorsToPrefs(List<Notes> colors) async {
    final SharedPreferences sharedPreferences= await SharedPreferences.getInstance();    //instance of shared prefrence

    // json encode karwaya toMap kar k
   final List<String> colorStrings = colors.map((color) => json.encode(color.toMap())).toList();

    await sharedPreferences.setStringList('list', colorStrings);

    List<String>? stringList = sharedPreferences.getStringList("list");

  //  print('stringList: $stringList');

  }
}



























// list.insert(0, notes);
// List<String> stringList = list
//     .map((item) => json.encode(item.toMap()))
//     .toList();
// sharedPreferences.setStringList(
//     "list", stringList)


// import 'color_event.dart';
// import 'color_state.dart';
//
// class ColorPickerBloc extends Bloc<ColorPickerEvent, ColorPickerState> {
//   final SharedPreferences sharedPreferences;
//
//   ColorPickerBloc(this.sharedPreferences) : super(ColorPickerState.initial()) {
//     on<AddColor>(
//           (event, emit) => addColor(event, emit),
//     );
//   }
//
//   addColor(AddColor event, Emitter<ColorPickerState> emit) async {
//     List<Notes> temp = [];
//     temp.addAll(state.noteColor.toList());
//     temp.add(event.noteColor);
//     await saveColorsToPrefs(temp);
//     emit(state.copyWith(noteColor: temp));
//   }
//
//   Future<void> saveColorsToPrefs(List<Notes> colors) async {
//     List<String> colorStrings = colors.map((color) => color.toString()).toList();
//     await sharedPreferences.setStringList('colors', colorStrings);
//   }
//}
// Ensure that you initialize the C