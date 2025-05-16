import 'package:indrive_clone_flutter/src/domain/useCases/socket/ConnectSocketUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/socket/DisconnectSocketUseCase.dart';

class SocketUseCases {
  ConnectSocketUsecase connect;
  DisconnectSocketUsecase disconnect;

  SocketUseCases({
    required this.connect,
    required this.disconnect,
  });
}
