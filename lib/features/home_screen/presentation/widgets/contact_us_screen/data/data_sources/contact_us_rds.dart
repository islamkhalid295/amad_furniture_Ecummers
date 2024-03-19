import 'package:cedage/core/api/api_consummer.dart';
import 'package:cedage/core/api/end_points.dart';
import 'package:cedage/features/home_screen/presentation/widgets/contact_us_screen/data/models/contatct_us_model.dart';

abstract class ContactUsRDS {
  Future<String> sendContactInfo(ContactUsModel contactUsModel);
}

class ContactUsRdsImp implements ContactUsRDS {
  final ApiConsumer client;

  ContactUsRdsImp({required this.client});

  @override
  Future<String> sendContactInfo(ContactUsModel contactUsModel) async {
      final response = await client.post(
        "${EndPoints.BASE_URL + EndPoints.CONTACT_US}",
        body: contactUsModel.toJson(),
      );
      return response?.data["message"];
  }
}
