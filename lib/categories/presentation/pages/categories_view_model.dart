import 'package:flutter/cupertino.dart';
import 'package:recipe_app/categories/data/repositories/categories_repository.dart';

import '../../data/models/categories_model.dart';

class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel({required CategoriesRepository repo}) : _repo = repo {
    load();
  }

  final CategoriesRepository _repo;

  List<CategoriesModel> categories = [];
  CategoriesModel? mainCategory;

  Future<void> load() async {
    var allCategories = await _repo.fetchCategories();
    mainCategory = allCategories.where((data) => data.main).firstOrNull;
    categories = allCategories.where((data) => data.id != mainCategory?.id).toList();
    notifyListeners();
  }
}
