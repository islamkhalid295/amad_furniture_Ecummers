import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/contact_us_screen/presentation/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/constantes.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getSectionHeight(context),

      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.myYellow.withOpacity(0.3),
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.contact_support_outlined,color: ColorManager.myYellow,size: 100,),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: SelectableText("تواصل معنا",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 300 * MediaQuery.of(context).size.width / 1440,
                    width: 300 * MediaQuery.of(context).size.width / 1440,
                    child: SelectableText("أننا نعمل باستمرار لجعل تجربتك فى طلب منتجاتنا اون لاين أفضل وأسهل لكى تتجنب عناء البحث عن المنتج في الصيدليات بمصر ، لذا إذا لديك أي شكاوى أو أسئلة أو مقترحات فتواصل معنا في أي وقت عبر ملأ هذه البيانات.",
                        style: TextStyle(fontSize: 20,)),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  color: ColorManager.myYellow.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                      children: [
                        DefaultTextFormField(
                          title: "البردي الالكتروني",
                          hintText: "examble@gmail.com",
                          icon: Icon(Icons.email_outlined),
                        ),
                        DefaultTextFormField(
                          title: "الهاتف",
                          hintText: "01095843764",
                          icon: Icon(Icons.phone_enabled_outlined),
                        ),
                        DefaultTextFormField(
                          height: 200,
                          title: "تواصل معنا",
                          hintText: ".....",

                        ),
                      ],
                    ),
                    MediaQuery.of(context).size.width > 1000 ? SvgPicture.asset("assets/images/contact_us.svg",height: 500 * MediaQuery.of(context).size.width / 1440,width: 500 * MediaQuery.of(context).size.width / 1440,) : Container(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
