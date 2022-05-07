import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_recipe/screen/my_recipe/view_model/my_recipe_view_model_detail.dart';

class OverViewScreen extends StatefulWidget {
  final String id;

  const OverViewScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

late MyRecipeViewModelDetail myRecipeViewModelDetail;

class _OverViewScreenState extends State<OverViewScreen> {
  Future<void> initDataRecipe() async {
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        myRecipeViewModelDetail = Provider.of<MyRecipeViewModelDetail>(context);
        await myRecipeViewModelDetail.getRecipeDetail(widget.id);
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDataRecipe();
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            foodImage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                foodName(),
                rating(),
              ],
            ),
            listIngrident()
          ],
        ),
      ),
    );
  }

  Widget foodName() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          myRecipeViewModelDetail.,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black87, fontSize: 25, fontWeight: FontWeight.w700),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget foodImage() {
    return ClipRect(
        child: Image.network(
      'https://i.pinimg.com/originals/0b/24/b2/0b24b2f23f3ff5d4c995de5c5df45245.jpg',
      width: double.infinity,
      height: 230,
      fit: BoxFit.cover,
    ));
  }

  Widget rating() {
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
          Text("5.0", style: const TextStyle(color: Colors.white))
        ]),
      ),
    );
  }

  Widget listIngrident() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Ingrident',
          style: TextStyle(
              color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
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
                  const Text('Cheese',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600))
                ],
              ),
            );
          },
        ),
      ]),
    );
  }
}
