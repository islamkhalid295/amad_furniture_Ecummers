import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/contact_us_screen/data/models/contatct_us_model.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/contact_us_screen/presentation/manager/contact_us_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/utils/constantes.dart';
import '../../../../../../core/utils/locator.dart';
import '../../../../../../core/utils/my_widget.dart';
import 'manager/contact_us_state.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ContactUsCubit(sl()),
  child: BlocConsumer<ContactUsCubit, ContactUsState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    ContactUsCubit cubit = ContactUsCubit.get(context);

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
                        child: Icon(
                          Icons.contact_support_outlined,
                          color: ColorManager.myYellow,
                          size: 100,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: SelectableText("تواصل معنا",
                        style: TextStyle(
                            fontSize: 40 * MediaQuery.of(context).size.width / 1440, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(

                    width: 300 * MediaQuery.of(context).size.width / 1000,
                    child: SelectableText(
                        "أننا نعمل باستمرار لجعل تجربتك فى طلب منتجاتنا اون لاين أفضل وأسهل لكى تتجنب عناء البحث عن المنتج في الصيدليات بمصر ، لذا إذا لديك أي شكاوى أو أسئلة أو مقترحات فتواصل معنا في أي وقت عبر ملأ هذه البيانات.",
                        style: TextStyle(
                          fontSize: 15 * MediaQuery.of(context).size.width / 1000,
                        )),
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
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Form(
                      key: ContactUsCubit.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DefaultTextFormField(
                            validator: ContactUsCubit.nameValidator,
                            controller: ContactUsCubit.nameController,
                            title: "الاسم",
                            hintText: "اسلام خالد",
                            icon: Icon(Icons.person_outline),
                          ),
                          DefaultTextFormField(
                            validator: ContactUsCubit.emailValidator,
                            controller: ContactUsCubit.emailController,
                            title: "البريد الالكتروني",
                            hintText: "examble@gmail.com",
                            icon: Icon(Icons.email_outlined),
                          ),
                          DefaultTextFormField(
                            validator: ContactUsCubit.phoneValidator,
                            controller: ContactUsCubit.phoneController,
                            title: "الهاتف",
                            hintText: "+201095843764",
                            icon: Icon(Icons.phone_enabled_outlined),
                          ),
                          DefaultTextFormField(
                            validator: ContactUsCubit.messageValidator,
                            controller: ContactUsCubit.messageController,
                            height: 200,
                            title: "تواصل معنا",
                            hintText: ".....",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          state is SendContactUsError
                              ? Text(
                                  state.error,
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                )
                              : SizedBox(),
                          MaterialButton(
                            onPressed: () {
                              if(ContactUsCubit.formKey.currentState!.validate()){
                                      cubit.sendContactUs(ContactUsModel(
                                        email:
                                            ContactUsCubit.emailController.text,
                                        name:
                                            ContactUsCubit.nameController.text,
                                        number:
                                            ContactUsCubit.phoneController.text,
                                        message:
                                            ContactUsCubit.messageController.text,
                                      ));
                                    }
                                  },
                            color: ColorManager.myBlack,
                            minWidth: 140,
                            height: 55,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: const BorderSide(
                                    color: ColorManager.myBlack,
                                    style: BorderStyle.solid)),
                            child: state is SendContactUsLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: ColorManager.myWhite,
                                  ))
                                : state is SendContactUsSuccsess? Icon(Icons.done_outline_outlined,color: ColorManager.myWhite,) :  state is SendContactUsError ? Icon(Icons.refresh,color: Colors.red,) : Text(
                                    'ارسال',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.59,
                                      fontFamily: 'Almarai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    MediaQuery.of(context).size.width > 1000
                        ? SvgPicture.asset(
                            "assets/images/contact_us.svg",
                            height:
                                500 * MediaQuery.of(context).size.width / 1440,
                            width:
                                500 * MediaQuery.of(context).size.width / 1440,
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  },
),
);
  }
}
