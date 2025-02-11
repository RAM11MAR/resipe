import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/categories/presentation/pages/categories_view_model.dart';
import 'package:recipe_app/categories/presentation/widgets/categories_item.dart';
import 'package:recipe_app/profile/presentation/widgets/bottom_nav_bar2.dart';
import 'package:recipe_app/profile/presentation/widgets/main_categories_item.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.vm});

  final CategoriesViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF1C0F0D),
            leading: SvgPicture.asset(
              "assets/myassets/back.svg",
              fit: BoxFit.none,
            ),
            title: Text(
              "Categories",
              style: TextStyle(
                color: Color(0xFFFD5D69),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: Color(0xFF1C0F0D),
          extendBody: true,
          body: CategoriesBody(viewModel: vm),
          bottomNavigationBar: BottomNavBar2(),
        );
      },
    );
  }
}

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({
    super.key,
    required this.viewModel,
  });

  final CategoriesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return ListView(
          children: [
            if (viewModel.mainCategory != null)
              MainCategoriesItem(
                title: viewModel.mainCategory?.title,
                image: viewModel.mainCategory?.image,
              ),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
              ),
              itemCount: viewModel.categories.length,
              itemBuilder: (context, index) {
                return CategoriesItem(
                  image: viewModel.categories[index].image,
                  title: viewModel.categories[index].title,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
