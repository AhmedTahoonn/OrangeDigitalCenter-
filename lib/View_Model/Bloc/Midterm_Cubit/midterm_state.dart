part of 'midterm_cubit.dart';

@immutable
abstract class MidtermState {}

class MidtermInitial extends MidtermState {}
class MidtermLoadingState extends MidtermState {}
class MidtermSuccessState extends MidtermState {}
class MidtermErrorState extends MidtermState {}