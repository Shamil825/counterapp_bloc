import 'package:counterapp_sample/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                 margin: EdgeInsets.only(right: 30),
                  height: 90,
                  width: 90,
                  child: FloatingActionButton(
                    backgroundColor: Colors.greenAccent,
                    onPressed: () {
                      context.read<CounterBloc>().add(Increment());
                    },
                    child: const Icon(Icons.add,color: Colors.black,),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Container(
                      padding: EdgeInsets.only(left: 0),
                      height: 100,
                      width: 100,
                      child: Text(
                        '${state.count}',
                        style: const TextStyle(
                          color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 100
                            ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                   margin: EdgeInsets.only(right: 30),
                  height: 90,
                  width: 90,
                  child: FloatingActionButton(
                    
                    backgroundColor: Colors.redAccent,
                    onPressed: () {
                      context.read<CounterBloc>().add(Decrement());
                    },
                    child: const Icon(Icons.remove,color: Colors.black,),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
