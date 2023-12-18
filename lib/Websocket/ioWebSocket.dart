// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:typed_data';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketClientExample {
  late IOWebSocketChannel channel;
  Uint8List? blobData;

  void startWebSocket() {
    channel = IOWebSocketChannel.connect('ws://192.168.1.111:82');

    channel.stream.listen((message) {
      channel.sink.add('stream');
      handleIncomingMessage(message);
    });
  }

  void sendMessage(String data) {
    channel.sink.add(data);
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
    channel.sink.close(status.goingAway);
  }
}
