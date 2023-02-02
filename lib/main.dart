import 'dart:developer';

import 'package:counter_inc_dec_using_stream/counter_bloc.dart';
import 'package:counter_inc_dec_using_stream/counter_event.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  final CounterBloc _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter Using stream',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _bloc.counter,
        initialData: 0,
        builder: (context, snapshot) {
          return Center(
            child: Text(snapshot.data.toString(),
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.w400)),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _bloc.inEvent.add(IncrementEvent()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () => _bloc.inEvent.add(DecrementEvent()),
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
