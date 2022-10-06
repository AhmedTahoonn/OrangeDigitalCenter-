import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:orange/Models/TermsModel/TermsModel.dart';

import '../../Database/Network/DioHelper.dart';
import '../../Database/Network/EndPoint.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(TermsInitial());
  static TermsCubit get(context)=>BlocProvider.of(context);
  TermsModel ?modelData;
  void getTermsData()
  {
    emit(TermsLoadingState());
    DioHelper.getData(url: termsEndPoint).then((value) {
      modelData=TermsModel.fromJson(value.data);
      print(modelData!.data!.terms);
      emit(TermsSuccessState());

    }).catchError((error){
      emit(TermsErrorState());

    });
  }

}
