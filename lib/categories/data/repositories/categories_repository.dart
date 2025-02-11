import 'package:recipe_app/categories/data/models/categories_model.dart';
import 'package:recipe_app/core/client.dart';

class CategoriesRepository{
  CategoriesRepository({required this.client});

  final ApiClient client;

  List<CategoriesModel> categories = [];

  Future<List<CategoriesModel>> fetchCategories()async{
    if(categories.isNotEmpty) return categories;
    List<dynamic> rawCategories = await client.fetchCategories(1);
    categories = rawCategories.map((data) => CategoriesModel.fromJson(data)).toList();
    return categories;
  }
}