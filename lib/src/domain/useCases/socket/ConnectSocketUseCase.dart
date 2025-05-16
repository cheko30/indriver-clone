import 'package:indrive_clone_flutter/src/domain/repository/SocketRepository.dart';

class ConnectSocketUsecase {
  SocketRepository socketRepository;
  ConnectSocketUsecase(this.socketRepository);

  run() => socketRepository.connect();
}
