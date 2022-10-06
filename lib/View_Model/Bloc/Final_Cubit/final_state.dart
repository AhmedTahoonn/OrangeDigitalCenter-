part of 'final_cubit.dart';

@immutable
abstract class FinalState {}

class FinalInitial extends FinalState {}
class FinalLoadingState extends FinalState {}
class FinalSuccessState extends FinalState {

}
class FinalErrorState extends FinalState {
}