import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/home/bloc/ClientHomeState.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  ClientHomeBloc() : super(ClientHomeState()) {
    on<ChangeDrawerPage>((event, emit) {
      emit(state.copyWith(pageIndex: event.pageIndex));
    });
  }
}
