import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:orange/Models/MidterModel/midtermModel.dart';
import 'package:orange/View_Model/Bloc/Final_Cubit/final_cubit.dart';

import '../../../Models/ExamModel/ExamModel.dart';
import '../../../constant.dart';
import '../../Database/Network/DioHelper.dart';
import '../../Database/Network/EndPoint.dart';

part 'midterm_state.dart';

class MidtermCubit extends Cubit<MidtermState> {
  MidtermCubit() : super(MidtermInitial());
  static MidtermCubit get(context)=>BlocProvider.of(context);
  ExamModel ?modelData;
  void getMidtermData()
  {
    emit(MidtermLoadingState());
    DioHelper.getData(url: examsEndPoint,token: token).then((value) {
      modelData=ExamModel.fromJson(value.data);
      print(modelData!.message);
      print(modelData!.code);
      print(modelData!.data![0].examSubject);
      emit(MidtermSuccessState());
    }).catchError((error){
      emit(MidtermErrorState());

    });
  }
}
