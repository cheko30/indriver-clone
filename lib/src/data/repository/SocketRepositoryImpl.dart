import 'package:indrive_clone_flutter/src/domain/repository/SocketRepository.dart';
import 'package:socket_io_client/src/socket.dart';

class SocketrepositoryImpl implements SocketRepository {
  Socket socket;
  SocketrepositoryImpl(this.socket);

  @override
  Socket connect() {
    return socket.connect();
  }

  @override
  Socket disconnect() {
    return socket.disconnect();
  }
}
