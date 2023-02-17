import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/data.dart';
import 'package:quran_app/quran_model.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  late QuranModel quranModel ;

  // Future<QuranModel> getQuranData () async{
  //   DataQuran().getData().then((value) {
  //     emit(QuranLoaded(dataQuran: value));
  //     quranModel = QuranModel.fromJson(value) ;
  //   });
  //   return quranModel;
  // }
}
