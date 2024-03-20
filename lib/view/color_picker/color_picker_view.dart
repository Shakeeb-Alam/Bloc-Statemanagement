import 'dart:convert';

import 'package:blocstate/domain/color_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../color_bloc/color_bloc.dart';
import '../../color_bloc/color_event.dart';
import '../../color_bloc/color_state.dart';
import 'library_view.dart';

// class ColorPickerView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => ColorPickerBloc(),
//       child: ColorPickerScreen(),
//     );
//   }
// }

class ColorPickerScreen extends StatefulWidget {
  const ColorPickerScreen({
    super.key,
  });

  @override
  State<ColorPickerScreen> createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  double redValue = 0;
  double greenValue = 0;
  double blueValue = 0;
  double opacityValue = 0;

  Color getColor() {
    return Color.fromRGBO(redValue.toInt(), greenValue.toInt(),
        blueValue.toInt(), opacityValue.toDouble());
  }

  List<Notes> list = [];
  //late SharedPreferences sharedPreferences;

  // getData() {
  //
  //   List<String>? stringList = sharedPreferences.getStringList("list");
  //
  //   if (stringList != null) {
  //     list =
  //         stringList.map((item) => Notes.fromJson(json.decode(item))).toList();
  //   }
  // }

  // @override
  // void initState() {
  //   context.read<ColorPickerBloc >() .add(GetData());
  //   super.initState();
  // }
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //     sharedPreferences = await SharedPreferences.getInstance();
  //     getData();
  //   });
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorPickerBloc, ColorPickerState>(
        builder: (context, state) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.download),
          onPressed: () {

            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.white,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                ),
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      //decoration: BoxDecoration(),
                      height: 300,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10.0),
                                // border: Border.all(
                                //   color: Colors.grey[400],
                                // ),
                              ),
                              child: TextFormField(
                                controller: title,
                                decoration: const InputDecoration(
                                  labelText: 'Enter your text',
                                  hintText: 'Type something here',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10.0),
                                // border: Border.all(
                                //   color: Colors.grey[400],
                                // ),
                              ),
                              child: TextFormField(
                                controller: description,
                                maxLines: 4,
                                decoration: const InputDecoration(
                                  labelText: 'Note..',
                                  hintText: 'Type something here',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blue,
                                  // text color
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  // button padding
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10), // button border radius
                                  ),
                                ),
                                onPressed: () async {
                                  Notes notes = Notes(
                                      redValue: redValue,
                                      greenValue: greenValue,
                                      blueValue: blueValue,
                                      opacityValue: opacityValue,
                                      title: title.text,
                                      description: description.text);

                                  // list.insert(0, notes);
                                  // List<String> stringList = list
                                  //     .map((item) => json.encode(item.toMap()))
                                  //     .toList();
                                  // sharedPreferences.setStringList(
                                  //     "list", stringList);
                                  context
                                      .read<ColorPickerBloc>()
                                      .add(AddColor(notes ));

                                  Navigator.pop(context, "loadData");
                                },
                                child: const Center(child: Text('save')))
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotesScreen()));
                },
                icon: const Icon(Icons.save))
          ],
          title: const Center(child: Text("Color Designer")),
        ),
        body: SafeArea(
          child: PopScope(
            canPop: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 120,
                  backgroundColor: getColor(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      'You can customize the following Sliders to view the changes render on the color pallete above '),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      'You can use the save button to save your background color'),
                ),
                const SizedBox(height: 10),
                Text('Red: ${redValue.toInt()}'),
                Row(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.red,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Slider(
                        value: redValue,
                        activeColor: Colors.red,
                        onChanged: (newValue) {
                          setState(() {
                            redValue = newValue;
                          });
                        },
                        min: 0,
                        max: 255,
                        divisions: 255,
                        label: redValue.round().toString(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.green,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Slider(
                        value: greenValue,
                        activeColor: Colors.green,
                        onChanged: (newValue) {
                          setState(() {
                            greenValue = newValue;
                          });
                        },
                        min: 0,
                        max: 255,
                        divisions: 255,
                        label: greenValue.round().toString(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Slider(
                        value: blueValue,
                        activeColor: Colors.blue,
                        onChanged: (newValue) {
                          setState(() {
                            blueValue = newValue;
                          });
                        },
                        min: 0,
                        max: 255,
                        divisions: 255,
                        label: blueValue.round().toString(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CircleAvatar(
                        radius: 20,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Slider(
                        value: opacityValue,
                        //activeColor: Colo,
                        onChanged: (newValue) {
                          setState(() {
                            opacityValue = newValue;
                          });
                        },
                        min: 0,
                        max: 100,
                        //divisions: 255,
                        label: opacityValue.round().toString(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
