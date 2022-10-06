import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/View_Model/Bloc/AddNote_Cubit/note_cubit.dart';
import 'package:orange/View_Model/Bloc/News_Cubit/news_cubit.dart';

import '../../Components/Settings/NoteTextFormField.dart';
import '../../Components/core/AppBar/AppBar.dart';
import '../../Components/core/TextFormField/TextFormField.dart';

class Add_notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => NoteCubit(),
      child: BlocConsumer<NoteCubit, NoteState>(
    listener: (context, state) {
     // TODO: implement listener
     },
  builder: (context, state) {
      NoteCubit.get(context).dateController.text=DateTime.now().toString();
    return Scaffold(
        appBar: customAppBar(
            title: "Add Note",
            context: context,
            leadingIcon: Icons.arrow_back_ios,
            leadingIconColor: Colors.black,
            leadingOnPressed: () {
              Navigator.pop(context);
            }
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 25.0, right: 15.0, left: 15.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                NoteTextFormField(labelText:"Title",controller: NoteCubit.get(context).titleController),
                const SizedBox(height: 20,),
                NoteTextFormField(labelText:"Date",controller: NoteCubit.get(context).dateController,enabled: false),
                const SizedBox(height: 20,),
                NoteTextFormField(hintText:"Note",controller: NoteCubit.get(context).noteController,maxLines: 6),
                const SizedBox(height: 30,),
                SizedBox(
                    height: 50,
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFBDBDBD)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Add',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
  },
),
    );
  }
}
