part of 'faq_cubit.dart';

abstract class FaqState {}

class FaqInitial extends FaqState {}
class FaqLoadingState extends FaqState {}
class FaqSuccessState extends FaqState {}
class FaqErrorState extends FaqState {}
class FaqChangeSelectedState extends FaqState {}



