


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../count_bloc/counter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Counter App'),

      ),
      body: BlocProvider(
        create: (_)=> CounterBloc(),
        child:CounterScreen() ,

      ),
    );
  }
}
class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc , CounterState>(
        builder: (context , state){
          return Center(

            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.counterValue.toString()),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(onPressed: (){
                      context.read<CounterBloc>().add(IncrementCounter());
                    },
                    child:const Icon(Icons.add),
                    ),
                   const SizedBox(width: 20,),
                    FloatingActionButton(onPressed:() {
                     if(state.counterValue > 0){context.read<CounterBloc>().add(DecrementCounter());}

                    },
                    child:const Icon(Icons.remove),)
                  ],
                )
              ],
            )
          );
        },

    );
  }
}

