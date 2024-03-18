import 'dart:convert';

import 'package:blocstate/domain/color_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../color_bloc/color_bloc.dart';
import '../../color_bloc/color_state.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  //List<Notes> list = [];
  late SharedPreferences sharedPreferences;

  //
  // getData() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   List<String>? stringList = sharedPreferences.getStringList("list");
  //   print(stringList);
  //   if (stringList != null) {
  //     list =
  //         stringList.map((item) => Notes.fromJson(json.decode(item))).toList();
  //   }
  //
  //   setState(() {
  //     list;
  //   });
  // }

  @override
  void initState() {
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Library"),
      ),
      body: BlocBuilder<ColorPickerBloc, ColorPickerState>(
          builder: (context, state) {
        print(state.noteColor.length);
        return state.noteColor.isEmpty
            ? Center(
                child: Text('error'),
              )
            : ListView.builder(
                itemCount: state.noteColor.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(4, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color.fromRGBO(
                              state.noteColor[index].redValue.toInt(),
                              state.noteColor[index].greenValue.toInt(),
                              state.noteColor[index].blueValue.toInt(),
                              state.noteColor[index].opacityValue.toDouble()),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.noteColor[index].title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(state.noteColor[index].description),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'R: ${state.noteColor[index].redValue.toInt()}'),
                            Text(
                                'G: ${state.noteColor[index].greenValue.toInt()}'),
                            Text(
                                'B: ${state.noteColor[index].blueValue.toInt()}'),
                            Text(
                                'A: ${(state.noteColor[index].opacityValue.toInt() / 100).toStringAsFixed(1)}'),
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  );
                });
      }),
    );
  }
}
