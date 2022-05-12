import 'package:flutter/material.dart';

import 'package:my_recipe/screen/my_recipe/overview_screen.dart';

class CardRecipe extends StatelessWidget {
  final String? foodName;
  final String? foodImage;
  final String foodId;
  final String like;

  const CardRecipe({
    Key? key,
    required this.foodName,
    required this.foodImage,
    required this.foodId,
    required this.like,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OverViewScreen(
                      id: foodId,
                      nameFood: foodName!,
                      image: foodImage!,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35),
                  BlendMode.multiply,
                ),
                image: foodImage != null
                    ? NetworkImage(foodImage!)
                    : const NetworkImage(
                        'https://www.solidbackgrounds.com/images/3840x2160/3840x2160-dark-gray-solid-color-background.jpg'),
                fit: BoxFit.cover)),
        child: Stack(children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                foodName ?? '',
                style: const TextStyle(fontSize: 19, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(children: [
                      const Icon(Icons.thumb_up_rounded,
                          color: Colors.orangeAccent, size: 18),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(like, style: const TextStyle(color: Colors.white))
                    ]),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(children: const [
                        Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                          size: 18,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text('Favorites', style: TextStyle(color: Colors.white))
                      ]),
                    ),
                  )
                ]),
            alignment: Alignment.bottomCenter,
          )
        ]),
      ),
    );
  }
}
