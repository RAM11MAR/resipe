import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/categories/data/repositories/categories_repository.dart';
import 'package:recipe_app/categories/presentation/pages/categories_view.dart';
import 'package:recipe_app/categories/presentation/pages/categories_view_model.dart';
import 'package:recipe_app/core/client.dart';

void main() => runApp(RecipeApp());

GoRouter router = GoRouter(
  initialLocation: '/onboarding',
  routes: [],
);

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoriesView(vm: CategoriesViewModel(repo: CategoriesRepository(client: ApiClient()))),
    );
  }
}