import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/profile/presentation/pages/profile_view_model.dart';
import 'package:recipe_app/profile/presentation/widgets/favorites_item.dart';
import 'package:recipe_app/profile/presentation/widgets/following.dart';
import 'package:recipe_app/profile/presentation/widgets/profile_share_edit.dart';
import '../widgets/bottom_nav_bar2.dart';
import '../widgets/category_item.dart';

class ProfileView extends StatelessWidget implements PreferredSizeWidget {
  const ProfileView({super.key, required this.viewModel});
  final ProfileViewModel viewModel;

  @override
  Size get preferredSize => const Size(double.infinity, 241);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => DefaultTabController(
        length: 2,
        child: viewModel.loading
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
          backgroundColor: const Color(0xFF1C0F0D),
          appBar: AppBar(
            toolbarHeight: 97,
            backgroundColor: const Color(0xFF1C0F0D),
            title: Row(
              children: [
                SizedBox(
                  width: 102,
                  height: 97,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.network(
                      viewModel.profile!.profilePhoto,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 200,
                  height: 72,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewModel.profile!.fullName,
                        style: const TextStyle(
                          color: Color(0xFFFD5D69),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "@${viewModel.profile!.username}",
                        style: const TextStyle(
                          color: Color(0xFFEC888D),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        viewModel.profile!.presentation,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFFFFFDF9),
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color(0xFFFFC6C9),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/heart.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      alignment: Alignment.center,
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color(0xFFFFC6C9),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/others.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size(356, 125),
              child: Column(
                children: [
                  SizedBox(
                    width: 356,
                    height: 83,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ProfileShareEdit(title: "Edit Profile"),
                            const SizedBox(width: 5),
                            ProfileShareEdit(title: "Share Profile"),
                          ],
                        ),
                        Following(viewModel: viewModel)
                      ],
                    ),
                  ),
                  const TabBar(
                    indicatorColor: Color(0xFFFD5D69),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Text(
                        "Recipes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Favorites",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          extendBody: true,
          body: TabBarView(
            children: [
              GridView.builder(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 60,
                ),
                itemCount: viewModel.recipes.length,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    image: viewModel.recipes[index].photo,
                    title: viewModel.recipes[index].title,
                    desc: viewModel.recipes[index].description,
                    rating: viewModel.recipes[index].rating,
                    duration: viewModel.recipes[index].timeRequired,
                  );
                },
              ),
              ListView(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                children: [
                  FavoritesItem(title: "Sweet", image: "assets/recipe/cake.png"),
                  const SizedBox(height: 50),
                  FavoritesItem(title: "Salty", image: "assets/recipe/breakfast.png"),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(const Color(0xFF1C0F0D)),
                    ),
                    child: ProfileShareEdit(title: "+ Create Collection"),
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: const Padding(
            padding: EdgeInsets.all(8.0),
            child: BottomNavBar2(),
          ),
        ),
      ),
    );
  }
}
