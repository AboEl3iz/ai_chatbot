import 'package:ai_chatbot/features/presentation/widget/ai_bubble_chat.dart';
import 'package:ai_chatbot/features/presentation/widget/custem_textfiels.dart';
import 'package:ai_chatbot/features/presentation/widget/user_bubble_chat.dart';
import 'package:ai_chatbot/features/state_manegment/cubit/ai_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readmore/readmore.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  XFile? _image;
  TextEditingController? controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          leading: const Icon(Icons.arrow_back_rounded),
          title: const Text("AI Chat"),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                size: 30,
              ),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/backgorund.jpeg"),
                  fit: BoxFit.cover)),
          child: CustomScrollView(
            
            slivers: [
              SliverToBoxAdapter(
                child: BlocBuilder<AiCubit, AiState>(
                  builder: (context, state) {
                    if (state is AiLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is AiSuccess) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.data.length,
                          itemBuilder: (context, index) => Column(
                                children: [
                                  UserBubbleChat(
                                    usertext: state.user[index],
                                  ),
                                  AiBubbleChat(
                                    textresponce: state.data[index],
                                  ),
                                ],
                              ));
                    } else if (state is AiFailure) {
                      return Text(state.message);
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: CustemTextFiels(controller: controller),
              )
            ],
          ),
        ));
  }
}






