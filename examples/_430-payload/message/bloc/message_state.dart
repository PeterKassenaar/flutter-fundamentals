class MessageState {
  final String message;

  const MessageState({this.message = ""});

  MessageState copyWith({String? message}) {
    return MessageState(
      message: message ?? this.message,
    );
  }
}