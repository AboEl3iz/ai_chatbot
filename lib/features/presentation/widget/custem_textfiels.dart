import 'package:ai_chatbot/features/state_manegment/cubit/ai_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustemTextFiels extends StatelessWidget {
  const CustemTextFiels({
    super.key,
    required this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.image),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                BlocProvider.of<AiCubit>(context)
                    .getdata(text: controller!.text!);
                controller!.clear();
              },
              icon: Icon(Icons.send_rounded))
        ],
      ),
    );
  }
}