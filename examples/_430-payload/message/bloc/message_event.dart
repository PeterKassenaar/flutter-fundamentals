abstract class MessageEvent {}

class UpdateMessageEvent extends MessageEvent {
  final String message;

  UpdateMessageEvent(this.message);
}