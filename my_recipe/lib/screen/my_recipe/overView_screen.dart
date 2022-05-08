import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_recipe/screen/my_recipe/view_model/my_recipe_view_model_detail.dart';

class OverViewScreen extends StatefulWidget {
  final String id;
  final String nameFood;
  final String image;

  const OverViewScreen({
    Key? key,
    required this.id,
    required this.nameFood,
    required this.image,
  }) : super(key: key);

  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

bool isLoading = true;

class _OverViewScreenState extends State<OverViewScreen> {
  Future<void> initDataRecipe() async {
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        var myRecipeViewModelDetail =
            Provider.of<MyRecipeViewModelDetail>(context, listen: false);
        await myRecipeViewModelDetail.getRecipeDetail(widget.id);
      },
    );
  }

  void checkData() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initDataRecipe();
    checkData();
  }

  @override
  Widget build(BuildContext context) {
    final myRecipeViewModelDetail =
        Provider.of<MyRecipeViewModelDetail>(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black87),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Recipe Overview',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : body(myRecipeViewModelDetail));
  }

  Widget body(MyRecipeViewModelDetail myRecipeViewModelDetail) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          foodImage(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              foodName(),
              rating(myRecipeViewModelDetail),
            ],
          ),
          listIngrident(myRecipeViewModelDetail),
          instruction(myRecipeViewModelDetail)
        ],
      ),
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
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
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
    return ClipRect(
        child: Image.network(
      widget.image,
      width: double.infinity,
      height: 230,
      fit: BoxFit.cover,
    ));
  }

  Widget rating(MyRecipeViewModelDetail myRecipeViewModelDetail) {
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
          const Icon(Icons.star, color: Colors.yellow, size: 18),
          const SizedBox(
            width: 7,
          ),
          myRecipeViewModelDetail.recipeDetail.spoonacularScore
                  .toString()
                  .isEmpty
              ? const Text(('Error'), style: TextStyle(color: Colors.white))
              : Text(
                  (myRecipeViewModelDetail.recipeDetail.spoonacularScore! / 20)
                      .toString(),
                  style: const TextStyle(color: Colors.white))
        ]),
      ),
    );
  }

  Widget listIngrident(MyRecipeViewModelDetail myRecipeViewModelDetail) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Ingrident',
          style: TextStyle(
              color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        myRecipeViewModelDetail.recipeDetail.extendedIngredients.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: myRecipeViewModelDetail
                    .recipeDetail.extendedIngredients.length,
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
                          child: Text(
                              myRecipeViewModelDetail.recipeDetail
                                  .extendedIngredients[index].original!,
                              maxLines: 10,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                        )
                      ],
                    ),
                  );
                },
              )
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

  Widget instruction(MyRecipeViewModelDetail myRecipeViewModelDetail) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text('Instruction',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                  fontSize: 16)),
          const SizedBox(
            height: 10,
          ),
          myRecipeViewModelDetail.recipeDetail.instructions!.isNotEmpty
              ? Text(
                  myRecipeViewModelDetail.recipeDetail.instructions!,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                )
              : const Text('Error',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.black, fontSize: 15)),
          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: myRecipeViewModelDetail
          //       .recipeDetail.analyzedInstructions.length,
          //   itemBuilder: (context, index) {
          //     return Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(myRecipeViewModelDetail.recipeDetail
          //                   .analyzedInstructions[index].steps[index].number
          //                   .toString() +
          //               '.'),
          //           const SizedBox(
          //             width: 16.0,
          //           ),
          //           Expanded(
          //             child: Text(
          //                 myRecipeViewModelDetail.recipeDetail
          //                     .analyzedInstructions[index].steps[index].step,
          //                 maxLines: 10,
          //                 textAlign: TextAlign.left,
          //                 style: const TextStyle(
          //                     fontSize: 15, fontWeight: FontWeight.w600)),
          //           )
          //         ],
          //       ),
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}
