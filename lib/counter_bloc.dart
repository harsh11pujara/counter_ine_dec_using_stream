import 'dart:async';

import 'package:counter_inc_dec_using_stream/counter_event.dart';

class CounterBloc{
  int count = 0;

  final StreamController counterStateController = StreamController<int>();

  StreamSink get inCounter => counterStateController.sink;

  Stream get counter => counterStateController.stream;

  final StreamController counterEventController = StreamController<CounterEvent>();

  Sink get inEvent => counterEventController.sink;

  CounterBloc(){
    counterEventController.stream.listen((event) => eventChangeListener(event),);
    inEvent.add(InitEvent());
  }

  eventChangeListener(CounterEvent event){
    if(event is IncrementEvent){
      count++;
      print('inc');
    }else if(event is InitEvent){
      count;
      print('start');
    }
    else{
      count--;
      print('dec');
    }

    inCounter.add(count);
  }
}


