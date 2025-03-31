import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

// import generated HelloWorld Service
import 'src/generated/helloworld.pbgrpc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'gRPC Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }

}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _responseMessage = "Press the button to say Hello from the gRPC Server";
  // String _response2 = ''; // Second string to call the second function. See slides, part 'optional'.

  Future<void> _callGrpcService() async {
    final channel = ClientChannel(
      'localhost', // Replace with your server's hostname or IP
      port: 50051,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    final stub = GreeterClient(channel);
    try {
      final response = await stub.sayHello(
        HelloRequest()..name = "Flutter", // You can replace "Flutter" with any name you want.
      );

      // Second call, to the new function
      final response2 = await stub.sayHelloAagain(
        HelloRequest()..name = 'Peter',
      );

      setState(() {
        _responseMessage = response.message;
        //_response2 = response2.message; // Set second message. See slides, part 'optional'.
      });
    } catch (e) {
      setState(() {
        _responseMessage = "Error: $e";
      });
    } finally {
      await channel.shutdown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("gRPC Client Demo App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _responseMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _callGrpcService,
              child: Text("Say Hello"),
            ),
            // OPTIONAL: Second method. See slides. Make sure to update and
            // restart the server, before using the UI below!
            // Text(
            //   _response2,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontSize: 18),
            // ),
            // SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: _callGrpcService,
            //   child: Text("Say Hello Again"),
            // ),
          ],
        ),
      ),
    );
  }
}
