import 'package:bloc/bloc.dart';
import 'package:blocstate/domain/color_model.dart';

import 'color_event.dart';
import 'color_state.dart';


class ColorPickerBloc extends Bloc<ColorPickerEvent, ColorPickerState> {
  ColorPickerBloc() : super(ColorPickerState.initial()) {
    on<AddColor>(
          (event, emit) => addColor(event, emit),
    );
  }
  addColor(AddColor event, Emitter<ColorPickerState> emit) {
    List<Notes> temp = [];
    temp.addAll(state.noteColor.toList());
    temp.add(event.noteColor);
    emit(state.copyWith(noteColor: temp));
  }

}