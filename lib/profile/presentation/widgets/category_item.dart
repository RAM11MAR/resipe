import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.rating,
    required this.duration,
  });

  final String image, title, desc, rating, duration;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -85,
              right: 5,
              left: 5,
              child: Container(
                padding: EdgeInsets.all(5),
                width: 159,
                height: 88,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFDF9),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF3E2823),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      desc,
                      style: const TextStyle(
                          color: Color(0xFF3E2823),
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.none),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              rating,
                              style: TextStyle(
                                  color: Color(0xFFEC888D),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none),
                            ),
                            SvgPicture.asset("assets/icons/star.svg"),
                          ],
                        ),
                        Row(

                          children: [
                            Text(
                              duration,
                              style: TextStyle(
                                color: Color(0xFFEC888D),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image(
                image: AssetImage(image),
                width: 169,
                height: 153,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color(0xFFFD5D69)),
                child: SvgPicture.asset(
                  "assets/icons/heart.svg",
                  fit: BoxFit.none,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
