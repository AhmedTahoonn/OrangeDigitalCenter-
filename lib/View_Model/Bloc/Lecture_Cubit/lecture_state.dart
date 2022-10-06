part of 'lecture_cubit.dart';

abstract class LectureState {}

class LectureInitial extends LectureState {}
class LectureLoadingState extends LectureState {}
class LectureSuccessState extends LectureState {

}
class LectureErrorState extends LectureState {
}