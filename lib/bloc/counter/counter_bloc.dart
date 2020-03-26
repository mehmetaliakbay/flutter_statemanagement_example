import 'dart:async';
import 'package:flutter_statemanagement/bloc/counter/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  // for state StreamController
  final _counterStateStreamController = StreamController<int>();
  Stream<int> get counterStateStream => _counterStateStreamController.stream;
  StreamSink<int> get _counterStateSink => _counterStateStreamController.sink;

  // for event StreamController
  final _counterEventStreamController = StreamController<CounterEvent>();
  Stream<CounterEvent> get _counterEventStream =>
      _counterEventStreamController.stream;
  StreamSink<CounterEvent> get counterEventSink =>
      _counterEventStreamController.sink;

  CounterBloc() {
    _counterEventStream.listen(_mapEventToSate);
  }

  void _mapEventToSate(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }
    _counterStateSink.add(_counter);
  }
}
