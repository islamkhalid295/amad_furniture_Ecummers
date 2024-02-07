import 'package:amad_furniture/features/home_screen/data/models/basic_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../domain/repositories/basic_page_data_repo.dart';

part 'basic_data_state.dart';

class BasicDataCubit extends Cubit<BasicDataState> {
  BasicDataCubit(this.basicDataRepo) : super(BasicDataInitial());
  final BasicDataRepo basicDataRepo;
 static BasicDataModel? basicDataModel;
  Future<dynamic> getBasicData() async {

    emit(GetBasicDataLoading());
    try {
      basicDataModel = await basicDataRepo.getBasicData();
      emit(GetBasicDataSuccess());
    } on DioException catch (e) {
      emit(GetBasicDataError(e.response?.data['message']));
    }

  }

}
