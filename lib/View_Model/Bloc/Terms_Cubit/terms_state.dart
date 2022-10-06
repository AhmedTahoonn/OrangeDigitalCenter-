part of 'terms_cubit.dart';

@immutable
abstract class TermsState {}

class TermsInitial extends TermsState {}
class TermsLoadingState extends TermsState {}
class TermsSuccessState extends TermsState {}
class TermsErrorState extends TermsState {}
