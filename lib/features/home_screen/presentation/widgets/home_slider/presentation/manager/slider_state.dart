part of 'slider_cubit.dart';

@immutable
abstract class SliderState {}

class SliderInitial extends SliderState {}

class RetriveSliderItemsLoading extends SliderState{}
class RetriveSliderItemsSuccsess extends SliderState{}
class RetriveSliderItemsError extends SliderState{}
class GetNextPage extends SliderState{}
class GetPreviousPage extends SliderState{}