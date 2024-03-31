import 'dart:html' as html;

import 'package:cedage/core/utils/color_manager.dart';
import 'package:cedage/features/home_screen/presentation/widgets/contact_us_screen/data/models/contatct_us_model.dart';
import 'package:cedage/features/home_screen/presentation/widgets/contact_us_screen/presentation/manager/contact_us_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/constantes.dart';
import '../../../../../../core/utils/locator.dart';
import '../../../../../../core/utils/my_widget.dart';
import '../../../manager/basic_data_cubit.dart';
import 'manager/contact_us_state.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsCubit(sl()),
      child: BlocConsumer<ContactUsCubit, ContactUsState>(
        listener: (context, state) {},
        builder: (context, state) {
          ContactUsCubit cubit = ContactUsCubit.get(context);

          return Column(
            children: [
              Container(
                height: getSectionHeight(context) - 100,
                child: MediaQuery.of(context).size.width > 600 ? Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorManager.primary.withOpacity(0.3),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.contact_support_outlined,
                                      color: ColorManager.primary,
                                      size: 100 *
                                          MediaQuery.of(context).size.width /
                                          1000 *
                                          MediaQuery.of(context).size.height /
                                          900,
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 30),
                                child: SelectableText("تواصل معنا",
                                    style: TextStyle(
                                        fontSize: 40 *
                                            MediaQuery.of(context).size.width /
                                            1440,
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(
                                width: 300 *
                                    MediaQuery.of(context).size.width /
                                    1000,
                                child: SelectableText(
                                    "أننا نعمل باستمرار لجعل تجربتك فى طلب منتجاتنا اون لاين أفضل وأسهل لكى تتجنب عناء البحث عن المنتج في الصيدليات بمصر ، لذا إذا لديك أي شكاوى أو أسئلة أو مقترحات فتواصل معنا في أي وقت عبر ملأ هذه البيانات او عبر وتساب من خلال الضغط هنا.",
                                    style: TextStyle(
                                      fontSize: 20 *
                                          MediaQuery.of(context).size.width /
                                          1440,
                                    )),
                              ),
                              MaterialButton(onPressed: () {
                                /* await launchUrl(Uri.parse('https://wa.me/+201091832829'));*/
                                html.window.open(
                                    'https://wa.me/${BasicDataCubit.basicDataModel?.callUs?.number}',
                                    '_blank');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    AssetsManager.whatsappIcon,
                                    fit: BoxFit.cover,
                                    width: 40,
                                    height: 40,
                                  ),
                                  const FittedBox(
                                    child: Text(
                                      'وتساب',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorManager.myWhite,
                                        fontSize: 17.59,
                                        fontFamily: 'Almarai',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10,)
                                ],
                              ),
                                minWidth: 100,
                                color: const Color(0xff2da539),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.primary.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Form(
                                key: ContactUsCubit.formKey,
                                child: SingleChildScrollView(
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
                                        icon: const Icon(Icons.person_outline),
                                      ),
                                      DefaultTextFormField(
                                        validator: ContactUsCubit.emailValidator,
                                        controller:
                                            ContactUsCubit.emailController,
                                        title: "البريد الالكتروني",
                                        hintText: "examble@gmail.com",
                                        icon: const Icon(Icons.email_outlined),
                                      ),
                                      DefaultTextFormField(
                                        validator: ContactUsCubit.phoneValidator,
                                        controller:
                                            ContactUsCubit.phoneController,
                                        title: "الهاتف",
                                        hintText: "+201095843764",
                                        icon: const Icon(Icons.phone_enabled_outlined),
                                      ),
                                      DefaultTextFormField(
                                        validator:
                                            ContactUsCubit.messageValidator,
                                        controller:
                                            ContactUsCubit.messageController,
                                        height: 200,
                                        title: "تواصل معنا",
                                        hintText: ".....",
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      state is SendContactUsError
                                          ? Text(
                                              state.error,
                                              style: const TextStyle(
                                                color: Colors.red,
                                              ),
                                            )
                                          : const SizedBox(),
                                      MaterialButton(
                                        onPressed: () {
                                          if (ContactUsCubit.formKey.currentState!
                                              .validate()) {
                                            cubit.sendContactUs(ContactUsModel(
                                              email: ContactUsCubit
                                                  .emailController.text,
                                              name: ContactUsCubit
                                                  .nameController.text,
                                              number: ContactUsCubit
                                                  .phoneController.text,
                                              message: ContactUsCubit
                                                  .messageController.text,
                                            ));
                                          }
                                        },
                                        color: ColorManager.myBlack,
                                        minWidth: 140,
                                        height: 55,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            side: const BorderSide(
                                                color: ColorManager.myBlack,
                                                style: BorderStyle.solid)),
                                        child: state is SendContactUsLoading
                                            ? const Center(
                                                child: CircularProgressIndicator(
                                                color: ColorManager.myWhite,
                                              ))
                                            : state is SendContactUsSuccsess
                                                ? const Icon(
                                                    Icons.done_outline_outlined,
                                                    color: ColorManager.myWhite,
                                                  )
                                                : state is SendContactUsError
                                                    ? const Icon(
                                                        Icons.refresh,
                                                        color: Colors.red,
                                                      )
                                                    : const Text(
                                                        'ارسال',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17.59,
                                                          fontFamily: 'Almarai',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              MediaQuery.of(context).size.width > 1000
                                  ? SvgPicture.asset(
                                fit: BoxFit.cover,
                                      "assets/images/Chat-amico.svg",
                                      height: 500 *
                                          MediaQuery.of(context).size.width /
                                          1440,
                                      width: 200 *
                                          MediaQuery.of(context).size.width /
                                          1440,

                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ) :
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorManager.primary.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.contact_support_outlined,
                                color: ColorManager.primary,
                                size: 100 *
                                    MediaQuery.of(context).size.width /
                                    1000 *
                                    MediaQuery.of(context).size.height /
                                    900,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: SelectableText("تواصل معنا",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width >600 ?
                                  40 * MediaQuery.of(context).size.width / 1440 : 40 * MediaQuery.of(context).size.width / 700,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(width: 30,),
                        MaterialButton(onPressed: () {
                          /* await launchUrl(Uri.parse('https://wa.me/+201091832829'));*/
                          html.window.open(
                              'https://wa.me/${BasicDataCubit.basicDataModel?.callUs?.number}',
                              '_blank');
                        },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                AssetsManager.whatsappIcon,
                                fit: BoxFit.cover,
                                width: 40,
                                height: 40,
                              ),
                              const FittedBox(
                                child: Text(
                                  'وتساب',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorManager.myWhite,
                                    fontSize: 17.59,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10,)
                            ],
                          ),
                          minWidth: 100,
                          color: const Color(0xff2da539),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.primary.withOpacity(0.5),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                        ),),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: ContactUsCubit.formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  DefaultTextFormField(
                                    width: 200,
                                    validator: ContactUsCubit.nameValidator,
                                    controller: ContactUsCubit.nameController,
                                    title: "الاسم",
                                    hintText: "اسلام خالد",
                                    icon: const Icon(Icons.person_outline),
                                  ),
                                  DefaultTextFormField(
                                    width: 200,
                                    validator: ContactUsCubit.emailValidator,
                                    controller:
                                    ContactUsCubit.emailController,
                                    title: "البريد الالكتروني",
                                    hintText: "examble@gmail.com",
                                    icon: const Icon(Icons.email_outlined),
                                  ),
                                  DefaultTextFormField(
                                    width: 200,
                                    validator: ContactUsCubit.phoneValidator,
                                    controller:
                                    ContactUsCubit.phoneController,
                                    title: "الهاتف",
                                    hintText: "+201095843764",
                                    icon: const Icon(Icons.phone_enabled_outlined),
                                  ),
                                  DefaultTextFormField(
                                    width: 200,
                                    validator:
                                    ContactUsCubit.messageValidator,
                                    controller:
                                    ContactUsCubit.messageController,
                                    height: 150,
                                    title: "تواصل معنا",
                                    hintText: ".....",
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  state is SendContactUsError
                                      ? Text(
                                    state.error,
                                    style: const TextStyle(
                                      color: Colors.red,
                                    ),
                                  )
                                      : const SizedBox(),
                                  MaterialButton(
                                    onPressed: () {
                                      if (ContactUsCubit.formKey.currentState!
                                          .validate()) {
                                        cubit.sendContactUs(ContactUsModel(
                                          email: ContactUsCubit
                                              .emailController.text,
                                          name: ContactUsCubit
                                              .nameController.text,
                                          number: ContactUsCubit
                                              .phoneController.text,
                                          message: ContactUsCubit
                                              .messageController.text,
                                        ));
                                      }
                                    },
                                    color: ColorManager.myBlack,
                                    minWidth: 140,
                                    height: 55,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(25),
                                        side: const BorderSide(
                                            color: ColorManager.myBlack,
                                            style: BorderStyle.solid)),
                                    child: state is SendContactUsLoading
                                        ? const Center(
                                        child: CircularProgressIndicator(
                                          color: ColorManager.myWhite,
                                        ))
                                        : state is SendContactUsSuccsess
                                        ? const Icon(
                                      Icons.done_outline_outlined,
                                      color: ColorManager.myWhite,
                                    )
                                        : state is SendContactUsError
                                        ? const Icon(
                                      Icons.refresh,
                                      color: Colors.red,
                                    )
                                        : const Text(
                                      'ارسال',
                                      textAlign:
                                      TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17.59,
                                        fontFamily: 'Almarai',
                                        fontWeight:
                                        FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                decoration: const ShapeDecoration(
                  color: ColorManager.darkPrimary,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: ColorManager.myGrayLite),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: MediaQuery.of(context).size.width > 1000
                      ? BlocBuilder<BasicDataCubit, BasicDataState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                state is GetBasicDataLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const DefaultSelectableText(
                                            'اتصل بنا',
                                            style: TextStyle(
                                              color: ColorManager.myWhite,
                                              fontSize: 26,
                                              fontFamily: 'Almarai',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const DefaultSelectableText(
                                            'البريد الالكتروني',
                                            style: TextStyle(
                                              color: ColorManager.myWhite,

                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          DefaultSelectableText(
                                            BasicDataCubit.basicDataModel !=
                                                    null
                                                ? BasicDataCubit.basicDataModel
                                                        ?.callUs?.email ??
                                                    " "
                                                : " ",
                                            style: const TextStyle(
                                              color: ColorManager.myWhite,

                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const DefaultSelectableText(
                                            'رقم الجوال',
                                            style: TextStyle(
                                              color: ColorManager.myWhite,

                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          DefaultSelectableText(
                                            BasicDataCubit.basicDataModel !=
                                                    null
                                                ? BasicDataCubit.basicDataModel
                                                        ?.callUs?.number ??
                                                    " "
                                                : " ",
                                            style: const TextStyle(
                                              color: ColorManager.myWhite,

                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                state is GetBasicDataLoading
                                    ? Expanded(
                                        child: const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                    : Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: BasicDataCubit
                                              .basicDataModel!.socialmedia!
                                              .map(
                                                (e) => e.logo == '' ? const SizedBox():Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          /*"https://eaglespiritgourmet.com/wp-content/uploads/2023/12/minimalist-olive-oil-bottle-glass-600x600.webp"*/ e
                                                                  .logo ??
                                                              "",
                                                      placeholder: (context,
                                                              url) =>
                                                          const Center(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                      errorWidget: (context,
                                                          url, error) {
                                                        return const Icon(
                                                            Icons.error);
                                                      },
                                                      fit: BoxFit.cover,
                                                      height: socialMediaIconsSize,
                                                      width: socialMediaIconsSize,
                                                      alignment:
                                                          Alignment.center,
                                                    ),
                                                    onTap: () {
                                                      html.window.open(
                                                          e.url ?? "",
                                                          '_blank',
                                                      );
                                                    },
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                Container(
                                  height: 120,
                                  width: 300,
                                  child: Image.asset(
                                    AssetsManager.camponyLogo,
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      : BlocBuilder<BasicDataCubit, BasicDataState>(
                          builder: (context, state) {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  state is GetBasicDataLoading
                                      ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                      : Container(
                                    color: ColorManager.darkPrimary,

                                        child: Column(
                                                                            crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                            children: [
                                        const DefaultSelectableText(
                                          'اتصل بنا',
                                          style: TextStyle(
                                            color: ColorManager.myWhite,

                                            fontSize: 26,
                                            fontFamily: 'Almarai',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const DefaultSelectableText(
                                          'البريد الالكتروني',
                                          style: TextStyle(
                                            color: ColorManager.myWhite,

                                            fontSize: 18,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        DefaultSelectableText(
                                          BasicDataCubit.basicDataModel !=
                                              null
                                              ? BasicDataCubit.basicDataModel
                                              ?.callUs?.email ??
                                              " "
                                              : " ",
                                          style: const TextStyle(
                                            color: ColorManager.myWhite,

                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const DefaultSelectableText(
                                          'رقم الجوال',
                                          style: TextStyle(
                                            color: ColorManager.myWhite,

                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        DefaultSelectableText(
                                          BasicDataCubit.basicDataModel !=
                                              null
                                              ? BasicDataCubit.basicDataModel
                                              ?.callUs?.number ??
                                              " "
                                              : " ",
                                          style: const TextStyle(
                                            color: ColorManager.myWhite,

                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                                                            ],
                                                                          ),
                                      ),
                                  const SizedBox(height: 50,),
                                  state is GetBasicDataLoading
                                      ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                      : Row(
                                        children: BasicDataCubit
                                            .basicDataModel!.socialmedia!
                                            .map(
                                              (e) => e.logo ==''?const SizedBox() : Padding(
                                            padding:
                                            const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                /*"https://eaglespiritgourmet.com/wp-content/uploads/2023/12/minimalist-olive-oil-bottle-glass-600x600.webp"*/ e
                                                    .logo ??
                                                    "",
                                                placeholder: (context,
                                                    url) =>
                                                const Center(
                                                    child:
                                                    CircularProgressIndicator()),
                                                errorWidget: (context,
                                                    url, error) {
                                                  return const Icon(
                                                      Icons.error);
                                                },
                                                fit: BoxFit.cover,
                                                width: MediaQuery.of(context).size.width > 400 ? socialMediaIconsSize : socialMediaIconsSize * MediaQuery.of(context).size.width/500,
                                                height: socialMediaIconsSize,
                                                alignment:
                                                Alignment.center,
                                              ),
                                              onTap: () {
                                                html.window.open(
                                                  e.url ?? "",
                                                  '_blank',
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                            .toList(),
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                      ),
                                  const SizedBox(height: 50,),
                                  state is GetBasicDataLoading
                                      ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                      : Container(
                                    height: 68,
                                    width: 164,
                                    child: Image.asset(AssetsManager.camponyLogo),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
