import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_recipe_app/core/base/base_service.dart';
import 'package:flutter_recipe_app/core/models/recipe_model.dart';

class ApiService extends BaseService {
  Future<List<Recipes>> getRecipes() async {
    final String response = await rootBundle.loadString('assets/response.json');
    Map<String, dynamic> data = jsonDecode(response);
    RecipeModel recipeModels = RecipeModel.fromJson(data);
    List<Recipes> recipes = recipeModels.recipes;
    return recipes;
  }
}
