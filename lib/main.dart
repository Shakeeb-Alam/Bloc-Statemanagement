import 'package:blocstate/view/color_picker/color_picker_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'color_bloc/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorPickerBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Form',
        color: Color(0xFF44697D),
        home: ColorPickerScreen(

        ),
      ),
    );
  }
// Widget build(BuildContext context) {
//   return MaterialApp(
//     title: 'Flutter Demo',
//     home: ColorPickerScreen(),
//   );
// }
}


// import 'package:blocstate/view/counter_screen.dart';
// import 'package:blocstate/view/counter_view.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: CounterBlocPage(),
//     );
//   }
// }
//
