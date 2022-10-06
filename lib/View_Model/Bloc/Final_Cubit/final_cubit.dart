import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:orange/Models/ExamModel/ExamModel.dart';

import '../../../constant.dart';
import '../../Database/Network/DioHelper.dart';
import '../../Database/Network/EndPoint.dart';

part 'final_state.dart';

class FinalCubit extends Cubit<FinalState> {
  FinalCubit() : super(FinalInitial());
  static FinalCubit get(context)=>BlocProvider.of(context);
  ExamModel ?modelData;
  void getFinalData()
  {
    emit(FinalLoadingState());
    DioHelper.getData(url: examsEndPoint,token: token).then((value) {
      modelData=ExamModel.fromJson(value.data);
      print(modelData!.message);
      print(modelData!.code);
      print(modelData!.data![0].examStartTime);


      emit(FinalSuccessState());
    }).catchError((error){
      emit(FinalErrorState());

    });
  }
}
