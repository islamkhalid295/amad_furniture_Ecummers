import 'package:amad_furniture/core/use_case/use_case.dart';
import 'package:amad_furniture/core/utils/locator.dart' as di;
import 'package:amad_furniture/core/utils/my_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/constantes.dart';
import '../../../../../../../core/utils/locator.dart';
import '../../domain/models/slider_item_model.dart';
import '../manager/slider_cubit.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SliderCubit(sl())..retriveSliderItems(),
      child: BlocBuilder<SliderCubit, SliderState>(
        builder: (context, state) {
          SliderCubit sliderCubit = SliderCubit(sl());
          return state is RetriveSliderItemsLoading || true ? Container(
            height: getSectionHeight(context),
              child: Center(child: CircularProgressIndicator())):Stack(
            alignment: Alignment.center,
            children: [
              CarouselSlider(
                carouselController: SliderCubit.carouselController,
                options: CarouselOptions(
                  height: getSectionHeight(context),
                  viewportFraction: 1,
                  autoPlay: true,
                ),
                items: SliderCubit.sliderItemsList?.slider?.map((sliderItem) {
                  return Builder(
                    builder: (BuildContext context) {
                      return mySlider(context, sliderItem);
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(onPressed: () {
                      sliderCubit.getPreviousPage();
                    }, icon: Icon(Icons.arrow_back_ios_rounded))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(onPressed: () {
                      sliderCubit.getNextPage();
                    },
                        icon: Icon(Icons.arrow_forward_ios_rounded))),
              ),
            ],
          );
        },
      ),
    );
  }
}



// List<SliderItem> sliderItems = [
//   SliderItem(
//       title: "العنوان الأول",
//       description:
//       'العنايه بالشعر من أكثر ما يشغل الفتيات والسيدات، خاصة نموه وزيادة طوله، لذا تحرص العديد منهن على اللجوء لموضة الاكستينشين وتطويل الشعر بشكل ظاهرى فقط،',
//       imageUrl:
//       "https://img.freepik.com/free-photo/view-frame-with-cosmetics_23-2148549153.jpg?w=1380&t=st=1704927862~exp=1704928462~hmac=4c4db2a19c1bf422770554de66ab33bac7071d9fb75d493d0fe457efd5a6b9ef"),
//   SliderItem(
//       title: "العنوان الثاني",
//       description:
//       'العنايه بالبشرة من أكثر ما يشغل الفتيات والسيدات، خاصة نموه وزيادة طوله، لذا تحرص العديد منهن على اللجوء لموضة الاكستينشين وتطويل الشعر بشكل ظاهرى فقط،',
//       imageUrl:
//       "https://img.freepik.com/free-photo/macadamia-body-lotion-skin-cream_1150-42810.jpg?w=1060&t=st=1704922422~exp=1704923022~hmac=1001dfea69402c47d5e51ec993ec918fcf70e093097574816a86c0d844a846f5"),
//   SliderItem(
//       title: "العنوان الثالث",
//       description:
//       'العنايه بالبشرة من أكثر ما يشغل الفتيات والسيدات، خاصة نموه وزيادة طوله، لذا تحرص العديد منهن على اللجوء لموضة الاكستينشين وتطويل الشعر بشكل ظاهرى فقط،',
//       imageUrl:
//       "https://img.freepik.com/free-photo/front-view-oil-made-from-green-plant-with-copy-space_23-2148799507.jpg?w=1380&t=st=1704922575~exp=1704923175~hmac=723c00cdbf1bd4b3317cf2b5830936efa2e3761b8fb338a6e9dbc56c1dae59bd"),
// ];
