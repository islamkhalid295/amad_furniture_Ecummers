import 'package:cedage/core/use_case/use_case.dart';

import '../../data/models/faq_model.dart';
import '../repositories/faq_repo.dart';


class RetriveFaqUC extends UseCase<void,NoParams> {
  final FaqRepo faqRepo;

  RetriveFaqUC({required this.faqRepo});
  @override
  Future<FaqList> call(NoParams params) async {
    return await faqRepo.retriveFaq();
  }
}