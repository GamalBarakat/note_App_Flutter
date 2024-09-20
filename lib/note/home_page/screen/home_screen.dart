import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/note/home_page/manager/note_state.dart';
import 'package:note_app/note/home_page/screen/widget/note_card.dart';
import 'package:intl/intl.dart';
import '../manager/note_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'edit_note_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit()..getAllNote(),
      child: BlocConsumer<NoteCubit, NoteState>(
        listener: (context, state) {},
        builder: (context, state) {
          NoteCubit itemBloc = BlocProvider.of<NoteCubit>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Note',
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
              ),
              backgroundColor: Colors.blueAccent,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: itemBloc.noteList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      itemBloc.deleteNote(index: index);
                      itemBloc.getAllNote();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Note Deleted'),
                        ),
                      );
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditNoteScreen(
                              index: index,
                              currentTitle: itemBloc.noteList[index]['title'],
                              currentDescription: itemBloc.noteList[index]['description'],
                            ),
                          ),
                        );
                      },
                      child: NoteCard(
                        title: itemBloc.noteList[index]['title'],
                        content: itemBloc.noteList[index]['description'],
                        date:DateFormat('dd/MM/yyyy').format(DateTime.now()),
                        backgroundColor: Colors.primaries[index % Colors.primaries.length],
                      ),
                    ),
                  );
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Add New Note'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: const InputDecoration(
                              hintText: 'Enter note title',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: descriptionController,
                            maxLines: 2,
                            decoration: const InputDecoration(
                              hintText: 'Enter note description',
                              border: OutlineInputBorder(),
                            ),
                          ),

                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            itemBloc.addNote(
                              title: titleController.text,
                              description: descriptionController.text,
                            );
                            Navigator.of(context).pop();
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    );
                  },
                );
              },
              backgroundColor: Colors.blueAccent,
              child: const Icon(Icons.add,color: Colors.white,),
            ),
          );
        },
      ),
    );
  }
}




