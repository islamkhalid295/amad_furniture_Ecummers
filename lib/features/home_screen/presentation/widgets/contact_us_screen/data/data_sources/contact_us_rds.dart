import 'package:amad_furniture/core/api/api_consummer.dart';
import 'package:amad_furniture/core/api/end_points.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/contact_us_screen/data/models/contatct_us_model.dart';

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
    String message = response["message"].toString();
    print(message);
    return message;

    throw UnimplementedError();
  }
}
