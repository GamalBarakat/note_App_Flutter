import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(InitializeNoteState());

  List<dynamic>noteList=[];
  void getAllNote(){

    noteList=  Hive.box('Note').values.toList();


  }

  void addNote({required String name,required String phone,required String email})  {
    Hive.box('Note').add({
      'name':name,
       'phone':phone,
      'email':email

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
    required String name,
    required String phone,
    required String email
  }) {
    // Update the note in Hive
    Hive.box('Note').putAt(index, {
      'name':name,
      'phone':phone,
      'email':email
    });
    getAllNote();


    emit(UpdatedNoteLoading());
  }

}