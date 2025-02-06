import 'package:flutter/material.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_view_model.dart';
import 'package:recipe_app/onboarding/presentation/widgets/onboarding_elevated_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key, required this.viewModel});

  final OnboardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) => PageView.builder(
          controller: viewModel.controller,
          itemCount: viewModel.onboardingList.length + 1,
          itemBuilder: (context, index) {
            if (index >= viewModel.onboardingList.length) {
              return Center(child: CircularProgressIndicator());
            }
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image(
                  image: NetworkImage(viewModel.onboardingList[index].picture),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        width: double.infinity,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Column(
                          children: [

                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black, Colors.transparent],
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 48),
                  child: OnboardingElevatedButton(
                      callback: () => viewModel.controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear),
                      text: "Continue"),
                ),
              ],
            );
          },
          onPageChanged: (index) => viewModel.pageChangedCallBack(index, context),
        ),
      ),
    );
  }
}
