import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:orange/Models/NewsModel/NewsModel.dart';
import 'package:orange/View_Model/Database/Network/DioHelper.dart';
import 'package:orange/constant.dart';

import '../../Database/Network/EndPoint.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context)=>BlocProvider.of(context);
  NewsModel ?modelData;
  void getNewsData()
  {
    emit(NewsLoadingState());
    DioHelper.getData(url:newsEndPoint,token: token).then((value) {
      modelData=NewsModel.fromJson(value.data);
      print(modelData!.data![0].body);
      emit(NewsSuccessState());
    }).catchError((error){
      emit(NewsErrorState());
    });
  }
}
