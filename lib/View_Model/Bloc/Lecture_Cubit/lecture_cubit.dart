import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/View_Model/Database/Network/DioHelper.dart';
import 'package:orange/constant.dart';

import '../../../Models/LectureModel/LectureModel.dart';
import '../../Database/Network/EndPoint.dart';

part 'lecture_state.dart';

class LectureCubit extends Cubit<LectureState> {
  LectureCubit() : super(LectureInitial());
   static LectureCubit get(context)=>BlocProvider.of(context);
   LectureModel ?modelData;
   void getLectureData()
   {
     emit(LectureLoadingState());
   DioHelper.getData(url: lectureEndPoint,token: token).then((value) {
     modelData=LectureModel.fromJson(value.data);
     print(modelData!.message);
     print(modelData!.code);
     print(modelData!.data![0].lectureEndTime);


     emit(LectureSuccessState());
     }).catchError((error){
     emit(LectureErrorState());

   });
   }
}
