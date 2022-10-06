part of 'section_cubit.dart';

abstract class SectionState {}

class SectionInitial extends SectionState {}
class SectionLoadingState extends SectionState {}
class SectionSuccessState extends SectionState {

}
class SectionErrorState extends SectionState {
}