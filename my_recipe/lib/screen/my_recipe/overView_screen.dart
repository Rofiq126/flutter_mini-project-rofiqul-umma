import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:my_recipe/screen/my_recipe/loading_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_recipe/model/my_recipe_model.dart';
import 'package:my_recipe/screen/my_recipe/view_model/my_recipe_view_model.dart';

class OverViewScreen extends StatefulWidget {
  final String id;
  final String nameFood;
  final String image;
  bool isFavorite;

  OverViewScreen({
    Key? key,
    required this.id,
    required this.nameFood,
    required this.image,
    required this.isFavorite,
  }) : super(key: key);

  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

bool isLoading = true;

class _OverViewScreenState extends State<OverViewScreen> {
  Future<void> initDataRecipe() async {
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        var myRecipeViewModel =
            Provider.of<MyRecipeViewModel>(context, listen: false);
        await myRecipeViewModel.getRecipeDetail(widget.id);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initDataRecipe();
  }

  @override
  Widget build(BuildContext context) {
    final myRecipeViewModel = Provider.of<MyRecipeViewModel>(context);
    final isLoading = myRecipeViewModel.state == MyRecipeViewState.loading;
    final isError = myRecipeViewModel.state == MyRecipeViewState.error;
    if (isLoading) {
      return const Center(
        child: LoadingScreen(),
      );
    }
    if (isError) {
      return const Center(
        child: Text('There somenthing wrong :('),
      );
    }
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            body(myRecipeViewModel),
            buttonBack(),
            buttonFavorite(myRecipeViewModel),
          ],
        ),
      ),
    ));
  }

  Widget body(MyRecipeViewModel myRecipeViewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        foodImage(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            foodName(),
            likes(myRecipeViewModel),
          ],
        ),
        listIngrident(myRecipeViewModel),
        instruction(myRecipeViewModel)
      ],
    );
  }

  Widget foodName() {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: widget.nameFood.isNotEmpty
              ? Text(
                  widget.nameFood,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                )
              : const Text(
                  'Error',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                )),
    );
  }

  Widget foodImage() {
    //Succes state
    return widget.image.isNotEmpty
        ? ClipRect(
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              widget.image,
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
            ))
        //Failed state
        : ClipRect(
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              "assets/background_recipe_image_empty.jpg",
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
            ));
  }

  Widget likes(MyRecipeViewModel myRecipeViewModel) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(children: [
          const Icon(Icons.thumb_up_rounded, color: Colors.yellow, size: 18),
          const SizedBox(
            width: 7,
          ),
          //Failed state
          myRecipeViewModel.recipeDetail.aggregateLikes.toString().isEmpty
              ? const Text(('Error'), style: TextStyle(color: Colors.white))
              //Succes state
              : Text(myRecipeViewModel.recipeDetail.aggregateLikes.toString(),
                  style: const TextStyle(color: Colors.white))
        ]),
      ),
    );
  }

  Widget listIngrident(MyRecipeViewModel myRecipeViewModel) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Ingrident',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        //Succes state
        myRecipeViewModel.recipeDetail.extendedIngredients.isNotEmpty
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                    myRecipeViewModel.recipeDetail.extendedIngredients.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.orangeAccent,
                          ),
                          height: 10,
                          width: 10,
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: myRecipeViewModel
                                      .recipeDetail
                                      .extendedIngredients[index]
                                      .originalName !=
                                  null
                              ? Text(
                                  myRecipeViewModel.recipeDetail
                                      .extendedIngredients[index].original!,
                                  maxLines: 10,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600))
                              : const Text('error'),
                        )
                      ],
                    ),
                  );
                },
              )
            //Failed state
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.orangeAccent,
                      ),
                      height: 10,
                      width: 10,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    const Text('Error',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600))
                  ],
                ),
              )
      ]),
    );
  }

  Widget instruction(MyRecipeViewModel myRecipeViewModel) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text('Instruction',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
          const SizedBox(
            height: 10,
          ),
          //Succes state
          myRecipeViewModel.recipeDetail.instructions != null
              ? Html(
                  data: myRecipeViewModel.recipeDetail.instructions,
                )
              //Failed state
              : const Text('Error',
                  textAlign: TextAlign.justify, style: TextStyle(fontSize: 15)),
        ],
      ),
    );
  }

  Widget buttonBack() {
    return Positioned(
      top: 25,
      left: 15,
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.35),
            borderRadius: BorderRadius.circular(100),
          ),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          )),
    );
  }

  Widget buttonFavorite(MyRecipeViewModel myRecipeViewModel) {
    return Positioned(
      top: 25,
      right: 15,
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.35),
            borderRadius: BorderRadius.circular(100),
          ),
          child: InkWell(
            onTap: () {
              myRecipeViewModel.addFavorites(Favorites(
                  name: widget.nameFood,
                  id: widget.id,
                  image: widget.image,
                  rating: myRecipeViewModel.recipeDetail.aggregateLikes
                      .toString()
                      .toString()));
              widget.isFavorite = !widget.isFavorite;
            },
            child: Icon(Icons.favorite_rounded,
                color: widget.isFavorite ? Colors.redAccent : Colors.white),
          )),
    );
  }
}
