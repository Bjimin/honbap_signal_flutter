import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honbap_signal_flutter/bloc/auth/auth_screen/auth_screen_event.dart';
import 'package:honbap_signal_flutter/bloc/auth/auth_screen/auth_screen_state.dart';

class AuthScreenBloc extends Bloc<AuthScreenEvent, AuthScreenState> {
  AuthScreenBloc()
      : super(const AuthScreenState(screen: AuthScreenEnum.phoneCheck)) {
    on<AuthScreenEvent>(_handleAuthScreenEvent);
  }

  Future<void> _handleAuthScreenEvent(
    AuthScreenEvent event,
    Emitter<AuthScreenState> emit,
  ) async {
    emit(AuthScreenState(screen: event.screen));
  }
}
