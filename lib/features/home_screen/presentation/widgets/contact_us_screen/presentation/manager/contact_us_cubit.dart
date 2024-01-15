import 'package:amad_furniture/core/exceptions/server/server_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/contatct_us_model.dart';
import '../../domain/use_cases/send_contact_info_uc.dart';
import 'contact_us_state.dart';


class ContactUsCubit extends Cubit<ContactUsState> {
  final SendContactUsUC sendContactUsUC;

  ContactUsCubit(this.sendContactUsUC) : super(ContactUsInitial());
  static String? message;
  static var formKey = GlobalKey<FormState>();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController nameController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController messageController = TextEditingController();
  static FormFieldValidator<String>? emailValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب ادخال البريد الإلكتروني';
    } else {
      return null;
    }
  };
  static FormFieldValidator<String>? nameValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب ادخال الاسم';
    } else {
      return null;
    }
  };
  static FormFieldValidator<String>? phoneValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب ادخال رقم الهاتف';
    } else if(value.length<11){
      return 'يرجي ادخال كود الدولة متبوعاً برقم الهاتف +20115222222';
    }else {
      return null;
    }
  };
  static FormFieldValidator<String>? messageValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب دخال الرسالة';
    } else {
      return null;
    }
  };

  static ContactUsCubit get(context) => BlocProvider.of(context);

   void sendContactUs (ContactUsModel contactUsModel)async
  {
    emit(SendContactUsLoading());
    try {
      message = await sendContactUsUC.call(contactUsModel);
      emit(SendContactUsSuccsess());
    }catch(e){

      print("error : ${e.toString()}");
      emit(SendContactUsError(error: e.toString()));
    }
  }

}
