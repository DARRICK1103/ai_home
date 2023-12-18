import 'dart:typed_data';
import 'package:ai_home/Websocket/ioWebSocket.dart';
import 'package:flutter/material.dart';

class WebSocketStreamWidget extends StatefulWidget {
  @override
  _WebSocketStreamWidgetState createState() => _WebSocketStreamWidgetState();
}

class _WebSocketStreamWidgetState extends State<WebSocketStreamWidget> {
  WebSocketClientExample _webSocketClient = WebSocketClientExample();

  @override
  void initState() {
    super.initState();
    _webSocketClient.startWebSocket();
    _webSocketClient.sendMessage("stream");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<Uint8List?>(
        stream: Stream.periodic(Duration(milliseconds: 500))
            .asyncMap((event) async {
          return _webSocketClient.blobData;
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print(ConnectionState.values);
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData && snapshot.data != null) {
            // Display the streamed data in your UI.
            return Image.memory(snapshot.data!);
          } else {
            return Text('Waiting for data...');
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _webSocketClient.closeConnection();
    super.dispose();
  }
}
