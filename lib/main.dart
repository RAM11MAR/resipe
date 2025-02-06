import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/onboarding/data/repositories/onboarding_repository.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_view.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_view_model.dart';
import 'package:recipe_app/profile/data/repositories/profile_repository.dart';
import 'package:recipe_app/profile/presentation/pages/profile_view.dart';
import 'package:recipe_app/profile/presentation/pages/profile_view_model.dart';

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
      home: ProfileView(viewModel: ProfileViewModel(repo: ProfileRepository(client: ApiClient()))),
    );
  }
}
