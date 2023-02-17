part of 'quran_cubit.dart';

@immutable
abstract class QuranState {}

class QuranInitial extends QuranState {}


class QuranLoaded extends QuranState{
  final dataQuran  ;

  QuranLoaded({required this.dataQuran});
}