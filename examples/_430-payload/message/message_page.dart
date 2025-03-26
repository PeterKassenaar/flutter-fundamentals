import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/message_bloc.dart';
import 'bloc/message_state.dart';
import 'bloc/message_event.dart';

// Now, in main.dart don't forget to wrap this page inside a BlocProvider()!
// Otherwise, it will not work, as this widget doesn't have access to
// the state. Update the main.dart-file with this class:
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => MessageBloc(),
//       child: MaterialApp(
//         home: const MessagePage(),
//       ),
//     );
//   }
// }

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message Input Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<MessageBloc, MessageState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  state.message.isEmpty
                      ? "Type your message below"
                      : "Current Message: ${state.message}",
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                context.read<MessageBloc>().add(UpdateMessageEvent(value));
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter a message",
              ),
            ),
          ),
        ],
      ),
    );
  }
}