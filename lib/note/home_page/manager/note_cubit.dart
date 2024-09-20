import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(InitializeNoteState());

  List<dynamic>noteList=[];
  void getAllNote(){

    noteList=  Hive.box('Note').values.toList();


  }

  void addNote({required String title,required String description})  {
    Hive.box('Note').add({
      'title':title,
       'description':description,

    });
    getAllNote();
    print(noteList.length);
    emit(AddNoteLoading());
  }

  void deleteNote({required int index}){
    Hive.box('Note').deleteAt(index);

    emit(AddNoteLoading());
  }
  void updateNote({
    required int index,
    required String title,
    required String description,
  }) {
    // Update the note in Hive
    Hive.box('Note').putAt(index, {
      'title': title,
      'description': description,
    });
    getAllNote();


    emit(UpdatedNoteLoading());
  }

}