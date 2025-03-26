import 'package:flutter_bloc/flutter_bloc.dart';
import 'message_event.dart';
import 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(const MessageState()) {
    on<UpdateMessageEvent>((event, emit) {
      emit(state.copyWith(message: event.message));
    });
  }
}