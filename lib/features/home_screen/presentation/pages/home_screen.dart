import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/features/Authantication/presentation/manager/authantication_cubit.dart';
import 'package:amad_furniture/features/home_screen/presentation/manager/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../../core/utils/constantes.dart';
import '../../../../core/utils/my_widget.dart';
import '../widgets/navigation_bar/presentation/navigation_bar_sign_in_button.dart';
import '../widgets/navigation_bar/presentation/shop_cart_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final AutoScrollController _scrollController = AutoScrollController();
  late TabController _tabController;
  int currentSection = 0;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: HomeScreenCubit.homeScreenSections.length, vsync: this);
  }

  int _getSectionIndexFromScrollOffset(double offset, double sectionHeight) {
    for (int i = 0; i < HomeScreenCubit.sectionsNumber; i++) {
      if (offset <= (sectionHeight * (4 / 5)) * (i + 1)) {
        return i;
      }
    }

    return -1; // Return the last section if offset is beyond all sections
  }

  void _onSectionChange(int index) {
    setState(() {
      currentSection = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthanticationCubit authanticationCubit = BlocProvider.of(context);
    if(token == null)
      {
        authanticationCubit.getToken();
      }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 200,
            leading: MediaQuery.of(context).size.width > 400
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 15),
                      Image.asset("assets/icons/eg.png"),
                      TextButton(
                          onPressed: () {},
                          child: const DefaultSelectableText(
                            "مصر",
                            style: TextStyle(
                              color: ColorManager.myBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 0.08,
                            ),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const DefaultSelectableText(
                            "English",
                            style: TextStyle(
                              color: ColorManager.myBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 0.08,
                            ),
                          )),
                    ],
                  )
                : null,
            title: MediaQuery.of(context).size.width > 630
                ? const Center(
                    child: FittedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: ColorManager.myBlack,
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          DefaultSelectableText(
                            "تمتع بخصم يصل الي 50% علي الماركات المختاره",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.78,
                              fontWeight: FontWeight.w400,
                              height: 0.10,
                            ),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorManager.myBlack,
                          ),
                        ],
                      ),
                    ),
                  )
                : null,
            // actions: [
            //   TextButton(
            //       onPressed: () {},
            //       child: const DefaultSelectableText(
            //         "اتصل بنا",
            //         style: TextStyle(
            //           color: Color(0xFF000F1F),
            //           fontSize: 13.78,
            //           fontWeight: FontWeight.w400,
            //           height: 0.10,
            //         ),
            //       )),
            //   Container(
            //     width: 1,
            //     height: 16,
            //     decoration: const BoxDecoration(color: Color(0xFF848484)),
            //   ),
            //   TextButton(
            //       onPressed: () {},
            //       child: const DefaultSelectableText(
            //         "التسجيل / تسجيل الدخول",
            //         style: TextStyle(
            //           color: Color(0xFF000F1F),
            //           fontSize: 13.78,
            //           fontWeight: FontWeight.w400,
            //           height: 0.10,
            //         ),
            //       )),
            // ],
            toolbarHeight: yellowBannarHeight,
            backgroundColor: ColorManager.myYellow,
            bottom: AppBar(
              toolbarHeight: tabBarHeight,
              backgroundColor: ColorManager.myWhite,
              leading: Padding(
                padding: EdgeInsets.only(
                    right: (90 * MediaQuery.of(context).size.width / 1235)),
                child: Image.asset("assets/icons/Link → logo.png.png"),
              ),
              leadingWidth: MediaQuery.of(context).size.width < 800
                  ? 200 * MediaQuery.of(context).size.width / 800
                  : 200,
              title: TabBar(
                controller: _tabController,
                onTap: (index) {
                  _scrollController.scrollToIndex(index,
                      preferPosition: AutoScrollPosition.begin);
                  _onSectionChange(index);
                },
                tabs: HomeScreenCubit.tabBarTabs,
                indicatorColor: ColorManager.myYellow,
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w700,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                dividerHeight: 1,
                labelPadding: EdgeInsets.symmetric(
                    horizontal: 40 * MediaQuery.of(context).size.width / 1440),
                isScrollable: true,
              ),
              actions: [
                SizedBox(
                  width: 30 * MediaQuery.of(context).size.width / 1440,
                ),
                ShopCart(),
                SizedBox(
                  width: 30 * MediaQuery.of(context).size.width / 1440,
                ),
                NavigationBarSignInButton(),
                // Container(
                //   decoration: BoxDecoration(border: Border.all(color: ColorManager.myYellow),borderRadius: BorderRadius.circular(10)),
                //   child: TextButton(onPressed: ()=> context.go('/authentication/create_account'), child: Text("تسجيل الدخول",style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 16,
                //     fontFamily: 'Almarai',
                //     fontWeight: FontWeight.w700,
                //   ),)),
                // ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          body: NotificationListener(
            onNotification: (notification) {
              if (notification is ScrollEndNotification) {
                print(notification.metrics.pixels);
                final index = _getSectionIndexFromScrollOffset(
                    notification.metrics.pixels, getSectionHeight(context));

                if (index != currentSection &&
                    !_tabController.indexIsChanging &&
                    index != -1) {
                  setState(() {
                    _tabController.index = index;
                    currentSection = index;
                  });
                }
              }
              return false;
            },
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: HomeScreenCubit.sectionsNumber,
              itemBuilder: (context, index) {
                return AutoScrollTag(
                  key: ValueKey(index),
                  controller: _scrollController,
                  index: index,
                  child: HomeScreenCubit.homeScreenSections[index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
