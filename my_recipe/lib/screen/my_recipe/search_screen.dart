import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:my_recipe/property/bottom_navbar.dart';
import 'package:my_recipe/screen/my_recipe/overview_screen.dart';
import 'package:provider/provider.dart';

import 'package:my_recipe/screen/my_recipe/view_model/my_recipe_view_model.dart';

class SearchScreen extends StatefulWidget {
  final String? name;
  const SearchScreen({
    Key? key,
    this.name,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController();

  Future<void> initResultSearch() async {
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        var myRecipeViewModel =
            Provider.of<MyRecipeViewModel>(context, listen: false);
        await myRecipeViewModel.getResultSearch(widget.name ?? '');
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initResultSearch();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myRecipeViewModel = Provider.of<MyRecipeViewModel>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Button back
                  buttonBack(),
                  //Textfield Search
                  textFieldSearch(myRecipeViewModel),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //List result search
              listResultSearch(myRecipeViewModel),
            ],
          ),
        ),
      )),
    );
  }

  Widget buttonBack() {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const BottomNavBar()));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget textFieldSearch(MyRecipeViewModel myRecipeViewModel) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TextFormField(
          controller: search,
          onChanged: (value) {
            myRecipeViewModel
                .getResultSearch(search.text)
                .then((value) => initState());
          },
          decoration: InputDecoration(
            hintText: 'Search any recipe',
            prefixIcon:
                const Icon(Icons.search_rounded, color: Colors.orangeAccent),
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    search.clear();
                  });
                },
                icon: const Icon(
                  Icons.clear_rounded,
                  color: Colors.redAccent,
                )),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.orangeAccent,
                ),
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
    );
  }

  Widget listResultSearch(MyRecipeViewModel myRecipeViewModel) {
    final isLoading = myRecipeViewModel.state == MyRecipeViewState.loading;
    final isError = myRecipeViewModel.state == MyRecipeViewState.error;
    if (isLoading) {
      return Center(
        child: LoadingFadingLine.circle(
          borderColor: Colors.orange,
          size: 40,
          backgroundColor: Colors.orangeAccent,
          duration: const Duration(milliseconds: 500),
        ),
      );
    }
    if (isError) {
      return const Center(
        child: Text('There something wrong :('),
      );
    }
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: myRecipeViewModel.recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OverViewScreen(
                              isFavorite:
                                  myRecipeViewModel.recipes[index].isFavorite,
                              id: myRecipeViewModel.recipes[index].id
                                  .toString(),
                              nameFood: myRecipeViewModel.recipes[index].title!,
                              image: myRecipeViewModel.recipes[index].image!)));
                },
                child: Text(myRecipeViewModel.recipes[index].title ?? '')),
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          NetworkImage(myRecipeViewModel.recipes[index].image!),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(100)),
            ),
          );
        });
  }

  Widget buildSearch() => SearchScreen(
        name: search.text,
      );
}
