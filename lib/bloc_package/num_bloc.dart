import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statemanagement/bloc_package/num_event.dart';
import 'package:flutter_statemanagement/bloc_package/num_state.dart';

class NumBloc extends Bloc<NumEvent, NumState> {
  @override
  get initialState => NumState.initial();

  @override
  Stream<NumState> mapEventToState(NumEvent event) async* {
    final _currentState = state;
    if (event is NumIncrementEvent) {
      yield NumState(number: state.number - 1);
    } else if (event is NumDecrementEvent) {
      yield NumState(number: state.number + 1);
    }
  }
}
