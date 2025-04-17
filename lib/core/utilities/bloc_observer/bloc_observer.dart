import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('Bloc/Cubit Created: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('Event Fired: $event in ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('State Changed in ${bloc.runtimeType}: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('Transition in ${bloc.runtimeType}: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('Error in ${bloc.runtimeType}: $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('Bloc/Cubit Closed: ${bloc.runtimeType}');
  }
}
