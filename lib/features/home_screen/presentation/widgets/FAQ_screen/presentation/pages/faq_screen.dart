import 'package:cedage/core/utils/constantes.dart';
import 'package:cedage/features/home_screen/presentation/widgets/FAQ_screen/presentation/manager/faq_cubit.dart';
import 'package:cedage/features/home_screen/presentation/widgets/FAQ_screen/presentation/manager/faq_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/color_manager.dart';
import '../widgets/questions_widget.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSectionHeight(context),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: BlocBuilder<FaqCubit, FaqState>(
                builder: (context, state) {
                  return Container(
                    decoration: BoxDecoration(
                        color: ColorManager.primary.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: state is RetriveFaqLoading
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ],
                            )
                          : state is RetriveFaqError ?  Center(child: Text(state.error,style: TextStyle(color: Colors.red),)):SingleChildScrollView(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                    itemBuilder: (context, index) =>
                                        QuestionsWidget(
                                            questions: FaqCubit
                                                .faqList!.faq![index].question,
                                            answer: FaqCubit
                                                .faqList!.faq![index].answer
                                        ),
                                    itemCount: FaqCubit.faqList?.faq?.length,

                                    shrinkWrap: true,
                                  ),
                                ],
                              ),
                          ),
                    ),
                  );
                },
              ),
            ),
          ),
          MediaQuery.of(context).size.width > 550
              ? Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      child: Column(
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
                                  Icons.question_answer_outlined,
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
                            child: SelectableText("الأسئلة الشائعة",
                                style: TextStyle(
                                    fontSize: 50 *
                                        MediaQuery.of(context).size.width /
                                        1440 * MediaQuery.of(context).size.height /
                                    1000,
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height:
                                250 * MediaQuery.of(context).size.height / 800,
                            width: 300 * MediaQuery.of(context).size.width / 1440,
                            child: SelectableText(
                                "قد تساعدك هذة الاسئلة في حل مشكلتك. \n فيحين لم تجد ما يساعدك فكل ماعليك هو التواصل معناوسنعمل علي حلها في اقرب وقت  ",
                                style: TextStyle(
                                  fontSize: 20 *
                                      MediaQuery.of(context).size.width /
                                      1000 * MediaQuery.of(context).size.height /
                                      800,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
