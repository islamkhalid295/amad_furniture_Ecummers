import 'dart:html' as html;

import 'package:cedage/core/utils/assets_manager.dart';
import 'package:cedage/core/utils/color_manager.dart';
import 'package:cedage/features/Authantication/presentation/manager/authantication_cubit.dart';
import 'package:cedage/features/home_screen/presentation/manager/home_screen_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/constantes.dart';
import '../../../cart_screen/presentation/manager/cart_cubit.dart';
import '../manager/basic_data_cubit.dart';
import '../widgets/FAQ_screen/presentation/pages/faq_screen.dart';
import '../widgets/about_us_screen/presentation/about_us_screen.dart';
import '../widgets/categories_screen/presentation/pages/catrgories_screen.dart';
import '../widgets/contact_us_screen/presentation/contact_us_screen.dart';
import '../widgets/home_slider/presentation/widgets/slider.dart';
import '../widgets/navigation_bar/presentation/navigation_bar_sign_in_button.dart';
import '../widgets/navigation_bar/presentation/shop_cart_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  static final AutoScrollController _scrollController = AutoScrollController();
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
    CartCubit cartCubit = BlocProvider.of(context);
    BasicDataCubit basicDataCubit = BlocProvider.of(context);
    if (CartCubit.cart == null) {
      cartCubit.getCart();
    }
    if (token == null) {
      authanticationCubit.getToken();
    }
    if (BasicDataCubit.basicDataModel == null) {
      basicDataCubit.getBasicData();
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          appBar: AppBar(
            toolbarHeight: tabBarHeight,
            backgroundColor: ColorManager.myWhite,
            leading: Padding(
              padding: EdgeInsets.only(
                  right: (90 * MediaQuery.of(context).size.width / 1440)),
              child: BlocBuilder<BasicDataCubit, BasicDataState>(
                builder: (context, state) {
                  return state is GetBasicDataLoading
                      ? Container(
                    child: Center(
                      child: SizedBox(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.yellow,
                          child: Container(child: Icon(Icons.image_search)),
                        ),
                      ),
                    ),
                  )
                      : CachedNetworkImage(
                    imageUrl:
                    /*"https://eaglespiritgourmet.com/wp-content/uploads/2023/12/minimalist-olive-oil-bottle-glass-600x600.webp"*/ BasicDataCubit
                        .basicDataModel!.logo?? "",
                    placeholder: (context, url) =>
                        SizedBox(
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.yellow,
                            child: Container(child: Icon(Icons.image_search)),
                          ),
                        ),
                    errorWidget: (context, url, error) {
                      return const Icon(Icons.error);
                    },
                    // fit: BoxFit.cover,
                    height: productItemImageHeight,
                    width: 200,
                    alignment: Alignment.center,
                  );
                },
              ),
            ),
            leadingWidth: MediaQuery.of(context).size.width < 800
                ? 200 * MediaQuery.of(context).size.width / 800
                : 200,
            title: TabBar(
              tabAlignment: TabAlignment.start,
              controller: _tabController,
              onTap: (index) {
                _scrollController.scrollToIndex(
                  index,
                  preferPosition: AutoScrollPosition.begin,
                  duration: Duration(
                    seconds: 3,
                  ),
                );
                _onSectionChange(index);
              },
              tabs: HomeScreenCubit.tabBarTabs,
              indicatorColor: ColorManager.myYellow,
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 16 * MediaQuery.of(context).size.width / 1000,
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
              const ShopCart(),
              SizedBox(
                width: 30 * MediaQuery.of(context).size.width / 1440,
              ),
              const NavigationBarSignInButton(),
              // Container(
              //   decoration: BoxDecoration(border: Border.all(color: ColorManager.myYellow),borderRadius: BorderRadius.circular(10)),
              //   child: TextButton(onPressed: ()=> context.go('/authentication/create_account'), child: Text("تسجيل الدخول",style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 16,
              //     fontFamily: 'Almarai',
              //     fontWeight: FontWeight.w700,
              //   ),)),
              // ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          floatingActionButton: IconButton(
            onPressed: () {
              /* await launchUrl(Uri.parse('https://wa.me/+201091832829'));*/
              html.window.open(
                  'https://wa.me/${BasicDataCubit.basicDataModel?.callUs?.number}',
                  '_blank');
            },
            hoverColor: Color(0x7643ff56),
            icon: Image.asset(
              AssetsManager.whatsappIcon,
              fit: BoxFit.cover,
              width: whatsAppIconsSize,
              height: whatsAppIconsSize,
            ),
          ) /*FloatingActionButton(
            // shape: CircleBorder(),
            backgroundColor: Color(0x52ff6f),
            onPressed: () async{
             */ /* await launchUrl(Uri.parse('https://wa.me/+201091832829'));*/ /*
              html.window.open('https://wa.me/${BasicDataCubit.basicDataModel?.callUs?.number}', '_blank');
            },
            child: Image.asset(AssetsManager.whatsappIcon,fit: BoxFit.cover),
          )*/
          ,
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
              shrinkWrap: false,
              itemCount: HomeScreenCubit.sectionsNumber,
              itemBuilder: (context, index) {
                return AutoScrollTag(
                  key: ValueKey(index),
                  controller: _scrollController,
                  index: index,
                  child: [
                    HomeSlider(onPressed: () {
                      _scrollController.scrollToIndex(
                        2,
                        preferPosition: AutoScrollPosition.begin,
                        duration: Duration(
                          seconds: 3,
                        ),
                      );
                      _onSectionChange(2);
                    }),
                    AboutUsScreen(),
                    CategoriesScreen(),
                    FaqScreen(),
                    ContactUsScreen(),
                    // AboutUsScreen(),
                    // AboutUsScreen(),
                  ][index] /*HomeScreenCubit.homeScreenSections[index]*/,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
