

import '../../data/data_sources/faq_rds.dart';
import '../../data/models/faq_model.dart';

abstract class FaqRepo {
  Future<FaqList> retriveFaq ();
}

class FaqRepoImp implements FaqRepo{
  final FaqRDS faqRDS;

  FaqRepoImp({required this.faqRDS});
  @override
  Future<FaqList> retriveFaq() async {
     return await faqRDS.retriveFaq();
  }

}