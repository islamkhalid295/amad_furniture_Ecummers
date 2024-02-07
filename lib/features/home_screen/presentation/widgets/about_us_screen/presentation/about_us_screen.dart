import 'package:amad_furniture/features/home_screen/presentation/widgets/about_us_screen/presentation/manager/about_us_screen_cubit.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/about_us_screen/presentation/manager/about_us_screen_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/constantes.dart';
import '../../../../../../core/utils/my_widget.dart';
import '../../../manager/basic_data_cubit.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getSectionHeight(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<BasicDataCubit, BasicDataState>(
  builder: (context, state) {
    return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SelectableText("مــن نــحـن",
                          style: TextStyle(
                              fontSize:
                                  35 * MediaQuery.of(context).size.width / 1440,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 250 * MediaQuery.of(context).size.height / 900,
                        child: BlocBuilder<AboutUsCubit, AboutUsState>(
                          builder: (context, state) {
                            return  state is RetriveAboutUsLoading ? Center(child: CircularProgressIndicator()) : SelectableText(
                               AboutUsCubit.aboutUsModel?.aboutUs ?? "",
                                style: TextStyle(
                                  fontSize: 15 *
                                      MediaQuery.of(context).size.width /
                                      1000 *
                                      MediaQuery.of(context).size.height /
                                      900,
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              state is GetBasicDataLoading
                  ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
                  : Container(
                    height: 150 * MediaQuery.of(context).size.height / 800,
                    decoration: BoxDecoration(
                      color: ColorManager.myYellow.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 15,
                          right: 15,
                          bottom: 15,
                          left:
                          40 * MediaQuery.of(context).size.width / 900),
                      child: Container(
                        height:
                        150 * MediaQuery.of(context).size.height / 830,
                        width: 150,
                        // width: 500 * MediaQuery.of(context).size.width / 1440 ,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                          /*"https://eaglespiritgourmet.com/wp-content/uploads/2023/12/minimalist-olive-oil-bottle-glass-600x600.webp"*/ BasicDataCubit
                              .basicDataModel!.logo?? "",
                          placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) {
                            return const Icon(Icons.error);
                          },
                          // fit: BoxFit.cover,
                          height: 150,
                          width: 150,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),

            ],
          );
  },
),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign:
                    BorderSide.strokeAlignCenter,
                    color: Colors.black
                        .withOpacity(0.3199999928474426),
                  ),
                ),
              ),
            ),
          ),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 300 * MediaQuery.of(context).size.height / 800,
                  decoration: BoxDecoration(
                    color: ColorManager.myYellow.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 15,
                        left: 15,
                        bottom: 15,
                        right:
                            40 * MediaQuery.of(context).size.width / 900),
                    child: Container(
                      height:
                          300 * MediaQuery.of(context).size.height / 830,
                      // width: 500 * MediaQuery.of(context).size.width / 1440 ,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CarouselSlider(
                        // carouselController: SliderCubit.carouselController,
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          autoPlay: true,
                        ),
                        items: /*SliderCubit.sliderItemsList?.slider?*/
                            [1,].map((sliderItem) {
                          return Builder(
                            builder: (BuildContext context) {
                              return CachedNetworkImage(
                                imageUrl:
                                AboutUsCubit.aboutUsModel?.image ??"" ,
                                placeholder: (context, url) =>
                                const Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) {
                                  return const Icon(Icons.error);
                                },
                                fit: BoxFit.cover,

                                alignment: Alignment.center,
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SelectableText("عن منتجاتنا",
                          style: TextStyle(
                              fontSize:
                                  35 * MediaQuery.of(context).size.width / 1440 * MediaQuery.of(context).size.height / 900,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 250 * MediaQuery.of(context).size.height / 900,
                        child: BlocBuilder<AboutUsCubit, AboutUsState>(
                          builder: (context, state) {
                            return  state is RetriveAboutUsLoading ? Center(child: CircularProgressIndicator()) : SelectableText(
                               AboutUsCubit.aboutUsModel?.aboutProducts ?? "",
                                style: TextStyle(
                                  fontSize: 15 *
                                      MediaQuery.of(context).size.width /
                                      1000 *
                                      MediaQuery.of(context).size.height /
                                      900,
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
