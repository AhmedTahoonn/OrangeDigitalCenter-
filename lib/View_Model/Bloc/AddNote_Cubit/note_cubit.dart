import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  static NoteCubit get(context)=>BlocProvider.of(context);
  TextEditingController titleController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController noteController=TextEditingController();

}
