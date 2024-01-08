import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WebSocketDHT(),
    );
  }
}

class WebSocketDHT extends StatefulWidget {
  const WebSocketDHT({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WebSocketDHTState();
  }
}

class _WebSocketDHTState extends State<WebSocketDHT> {
  String temp = "0";
  String humidity = "0";
  String heatindex = "0";
  late IOWebSocketChannel channel;
  bool connected = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      channelConnect();
    });
  }

  void channelConnect() {
    try {
      channel = IOWebSocketChannel.connect("ws://192.168.0.1:81");
      channel.stream.listen(
        (message) {
          print(message);
          setState(() {
            if (message == "connected") {
              connected = true;
            } else if (message.substring(0, 6) == "{'temp") {
              message = message.replaceAll(RegExp("'"), '"');
              Map<String, dynamic> jsondata = json.decode(message);
              setState(() {
                temp = jsondata["temp"];
                humidity = jsondata["humidity"];
                heatindex = jsondata["heat"];
              });
            }
          });
        },
        onDone: () {
          print("WebSocket is closed");
          setState(() {
            connected = false;
          });
        },
        onError: (error) {
          print(error.toString());
        },
      );
    } catch (_) {
      print("Error on connecting to WebSocket.");
    }
  }

  Future<void> sendCmd(String cmd) async {
    if (connected) {
      channel.sink.add(cmd);
    } else {
      channelConnect();
      print("WebSocket is not connected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DHT 11 - TEMP/HUMIDITY/HEAT INDEX"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: connected
                  ? const Text("WEBSOCKET: CONNECTED")
                  : const Text("DISCONNECTED"),
            ),
            Container(
              child: const Text(
                "Current Weather in Kathmandu",
                style: TextStyle(fontSize: 20, color: Colors.redAccent),
              ),
            ),
            Container(
              child: Text(
                "Temperature $temp°C | Humidity: $humidity",
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Container(
              child: Text("Heat Index: $heatindex°C"),
            ),
          ],
        ),
      ),
    );
  }
}



