import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/models/recipe_model.dart';
import 'package:flutter_recipe_app/core/services/api_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_recipe_app/core/logger.dart';

class HomeViewModel extends BaseViewModel {
  Logger log;
  ApiService apiService;
  List<Recipes> recipes = [];
  List<String> sliderImages = [];

  HomeViewModel({
    @required this.apiService,
  }) {
    this.log = getLogger(this.runtimeType.toString());
  }
  void getData() async {
    recipes = await apiService.getRecipes();
    recipes.forEach(
      (element) {
        sliderImages.add(element.pf);
        notifyListeners();
      },
    );
  }
}
