


import '../../data/data_sources/contact_us_rds.dart';
import '../../data/models/contatct_us_model.dart';

abstract class ContactUsRepo {
  Future<String> sendContactInfo (ContactUsModel contactUsModel);
}

class ContactUsRepoImp implements ContactUsRepo{
  final ContactUsRDS contactUsRDS;

  ContactUsRepoImp({required this.contactUsRDS});
  @override
  Future<String> sendContactInfo(ContactUsModel contactUsModel) async {
     return await contactUsRDS.sendContactInfo(contactUsModel);
  }

}