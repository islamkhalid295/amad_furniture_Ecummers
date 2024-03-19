import 'package:cedage/core/use_case/use_case.dart';

import '../../data/models/contatct_us_model.dart';
import '../repositories/contact_us_repo.dart';



class SendContactUsUC extends UseCase<String,ContactUsModel> {
  final ContactUsRepo contactUsRepo;

  SendContactUsUC({required this.contactUsRepo});
  @override
  Future<String> call(ContactUsModel contactUsModel) async {
    return await contactUsRepo.sendContactInfo(contactUsModel);
  }
}