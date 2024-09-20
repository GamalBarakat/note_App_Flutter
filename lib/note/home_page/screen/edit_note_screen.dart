import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/note/home_page/manager/note_state.dart';
import 'package:note_app/note/home_page/screen/widget/note_card.dart';

import '../manager/note_cubit.dart';


class EditNoteScreen extends StatelessWidget {
  final int index;
  final String currentTitle;
  final String currentDescription;
  final String currentEmail;
  const EditNoteScreen({
    Key? key,
    required this.index,
    required this.currentTitle,
    required this.currentDescription,
    required this.currentEmail
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: currentTitle);
    final phoneController = TextEditingController(text: currentDescription);
    final emailController = TextEditingController(text: currentDescription);
    return Scaffold(
      appBar: AppBar(
        title:  InkWell(onTap: (){


        },child: const Text('Edit Contact')),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (context)=>NoteCubit(),
          child: BlocConsumer<NoteCubit, NoteState>(
            listener: (context, state) {
              if (state is UpdatedNoteLoading) {
                BlocProvider.of<NoteCubit>(context).getAllNote();
                ScaffoldMessenger.of(context).showSnackBar(

                    const SnackBar(backgroundColor: Colors.green,content: Text(' updated successfully')),
              );
            }
            },
            builder: (context, state) {
              return Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: phoneController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(),
                    ),
                  ),


                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final itemBloc = BlocProvider.of<NoteCubit>(context);
                      itemBloc.updateNote(
                        index: index,
                        name: nameController.text,
                        phone: phoneController.text,
                        email: emailController.text
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Edit',style: TextStyle(color: Colors.white),),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
