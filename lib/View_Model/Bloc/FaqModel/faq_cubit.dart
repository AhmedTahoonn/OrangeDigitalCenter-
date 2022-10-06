import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/Models/FaqModel/FaqModel.dart';
import 'package:orange/View_Model/Database/Network/DioHelper.dart';

import '../../Database/Network/EndPoint.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());
 static  FaqCubit get(context)=>BlocProvider.of(context);
  bool selected = true;
  FaqModel ?modelData;
 void getFaqData()
 {
   emit(FaqLoadingState());
   DioHelper.getData(url: faqEndPoint).then((value) {
     modelData=FaqModel.fromJson(value.data);
     print(modelData!.data![0].answer);
     emit(FaqSuccessState());

   }).catchError((error){
     emit(FaqErrorState());

   });
 }

void changeSelected()
{
  selected=!selected;
  emit(FaqChangeSelectedState());
}
}
