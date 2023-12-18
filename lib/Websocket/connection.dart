// ignore_for_file: avoid_print
import 'dart:typed_data';

import 'package:web_socket_client/web_socket_client.dart';

class WebSocketClientExample {
  late WebSocket _socket;
  Uint8List? blobData;

  void startWebSocket() {
    // Create a WebSocket client.
    final uri = Uri.parse('ws://192.168.1.111:82');
    const backoff = ConstantBackoff(Duration(seconds: 1));
    _socket = WebSocket(uri, backoff: backoff);

    // Listen for changes in the connection state.
    _socket.connection.listen((state) {
      print('state: "$state"');
    });

    // Listen for incoming messages.
    _socket.messages.listen((message) {
      handleIncomingMessage(message);
    });
  }

  void sendMessage(String data) {
    _socket.send(data);
  }

  void handleIncomingMessage(dynamic message) {
    print("okkk");
    if (message is String) {
      // If data is a string, print 'Hi'.
      print('Hi');
    } else if (message is List<int>) {
      // If data is a list of integers, assume it's binary data (Blob).
      blobData = Uint8List.fromList(message);
    }
  }

  void closeConnection() {
    _socket.close();
  }
}
