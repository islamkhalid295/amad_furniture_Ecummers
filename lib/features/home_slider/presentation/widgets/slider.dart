import 'package:amad_furniture/core/api/dio_consummer.dart';
import 'package:amad_furniture/features/home_slider/data/remote/data_sources/slider_rds.dart';
import 'package:amad_furniture/features/home_slider/domain/repositories/slider_repo.dart';
import 'package:amad_furniture/features/home_slider/domain/use_cases/retrive_slider_items_uc.dart';
import 'package:amad_furniture/features/home_slider/presentation/manager/slider_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amad_furniture/core/utils/locator/locator.dart' as di;
class Slider extends StatelessWidget {
  const Slider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: const Placeholder(),
        create: (context) => di.sl<SliderCubit>());
  }
}
