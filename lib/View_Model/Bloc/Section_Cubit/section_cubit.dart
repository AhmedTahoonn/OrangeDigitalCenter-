import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/Models/SectionModel/SectionModel.dart';

import '../../../constant.dart';
import '../../Database/Network/DioHelper.dart';
import '../../Database/Network/EndPoint.dart';

part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  SectionCubit() : super(SectionInitial());
  static SectionCubit get(context)=>BlocProvider.of(context);
  SectionModel ?modelData;
  void getSectionData()
  {
    emit(SectionLoadingState());
    DioHelper.getData(url: sectionEndPoint,token: token).then((value) {
      modelData=SectionModel.fromJson(value.data);
      print(modelData!.message);
      print(modelData!.code);
      print(modelData!.data![0].sectionDate);


      emit(SectionSuccessState());
    }).catchError((error){
      emit(SectionErrorState());

    });
  }
}

