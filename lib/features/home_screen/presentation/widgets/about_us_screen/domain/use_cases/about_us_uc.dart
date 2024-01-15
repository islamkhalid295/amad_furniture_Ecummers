import 'package:amad_furniture/core/use_case/use_case.dart';

import '../../data/models/about_us_model.dart';
import '../repositories/about_us_repo.dart';


class RetriveAboutUsUC extends UseCase<void,NoParams> {
  final AboutUsRepo aboutUsRepo;

  RetriveAboutUsUC({required this.aboutUsRepo});
  @override
  Future<AboutUsModel> call(NoParams params) async {
    return await aboutUsRepo.retriveAboutUs();
  }
}