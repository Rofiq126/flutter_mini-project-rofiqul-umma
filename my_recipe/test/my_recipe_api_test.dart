import 'package:flutter_test/flutter_test.dart';
import 'package:my_recipe/model/api/my_recipe_api.dart';

void main() {
  test('Mengecek Recipe api', () async {
    var data = await RecipeAPI.getRecipe("20", '');
    expect(data.length, equals(20));
  });
  test('Mengecek Recipe api detail', ()  async{
    var data = await RecipeApiDetail.getRecipeDetail('296687');
    expect(data, isNotNull);
  });
}
