import 'package:indrive_clone_flutter/src/domain/repository/SocketRepository.dart';

class DisconnectSocketUsecase {
  SocketRepository socketRepository;
  DisconnectSocketUsecase(this.socketRepository);

  run() => socketRepository.disconnect();
}
