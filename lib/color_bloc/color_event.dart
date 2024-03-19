import 'dart:ui';

import 'package:blocstate/domain/color_model.dart';

abstract class ColorPickerEvent {}

class AddColor extends ColorPickerEvent {
  final Notes noteColor;
  AddColor(this.noteColor);

}
class GetData extends ColorPickerEvent{

}