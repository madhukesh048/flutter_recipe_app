import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/locator.dart';
import 'package:flutter_recipe_app/core/services/api_service.dart';
import 'package:flutter_recipe_app/widgets/dumb_widgets/slider/slider_widget.dart';
import 'package:stacked/stacked.dart';
import 'home_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController _pageController = PageController();
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (BuildContext context, HomeViewModel viewModel, Widget _) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(
                Icons.restaurant_menu,
              ),
              onPressed: () {
                //
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              inactiveColor: Colors.red,
              activeColor: Colors.red,
              icons: [
                Icons.favorite_border,
                Icons.share,
              ],
              activeIndex: 1,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.defaultEdge,
              onTap: (index) {
                //
              },
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 24, 16, 24),
              child: Column(
                children: [
                  viewModel.sliderImages.isNotEmpty
                      ? getSlider(context, viewModel)
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                  Expanded(
                    child: buildPageView(viewModel),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(
        apiService: locator<ApiService>(),
      ),
      onModelReady: (viewModel) {
        viewModel.getData();
      },
    );
  }

  Widget buildPageView(HomeViewModel viewModel) {
    return PageView.builder(
      controller: _pageController,
      itemCount: viewModel.recipes.length,
      onPageChanged: (index) {
        carouselController.animateToPage(
          index,
          duration: Duration(milliseconds: 400),
          curve: Curves.decelerate,
        );
      },
      itemBuilder: (context, index) {
        return SliderWidget(
          recipe: viewModel.recipes.elementAt(index).dc,
          calVal: viewModel.recipes.elementAt(index).cn,
          recipeName: viewModel.recipes.elementAt(index).fn,
          ingredientsMapList: viewModel.recipes.elementAt(index).ig,
        );
      },
    );
  }

  Widget getSlider(BuildContext context, HomeViewModel viewModel) {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 400),
            curve: Curves.decelerate,
          );
        },
        enableInfiniteScroll: false,
        height: MediaQuery.of(context).size.height / 2.4,
        autoPlay: false,
        enlargeCenterPage: true,
      ),
      items: viewModel.sliderImages.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                border: Border.all(
                  color: Colors.green,
                  style: BorderStyle.solid,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26.0),
                child: Image.asset(
                  i,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
