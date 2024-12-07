import 'package:ai_chatbot/core/ai_chat_api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'ai_state.dart';

class AiCubit extends Cubit<AiState> {
  AiCubit(this.aiChatApiService) : super(AiInitial());
  List<String> list = [];
  List<String> user = [];
  final AiChatApiService aiChatApiService;
  getdata({required String text}) async {
    try {
      emit(AiLoading());
      String data = await aiChatApiService.getdatafromchat(text: text);
      user.add(text);
      list.add(data);
      emit(AiSuccess(data: list,user: user));
    } on Exception catch (e) {
      emit(AiFailure(message: e.toString()));
    }
  }
}
