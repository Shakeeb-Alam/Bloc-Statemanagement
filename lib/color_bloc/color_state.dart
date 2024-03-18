import 'dart:ui';

import 'package:blocstate/domain/color_model.dart';
import 'package:flutter/material.dart';
class ColorPickerState {
  final List<Notes> noteColor;

  ColorPickerState({required this.noteColor});
  factory ColorPickerState.initial() => ColorPickerState(noteColor: []);

  ColorPickerState copyWith({List<Notes>? noteColor}) {
    return ColorPickerState(
      noteColor: noteColor ?? this.noteColor,
    );
  }

}