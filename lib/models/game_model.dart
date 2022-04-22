class GameModel {
  final String themeName;
  final int numberOfPairs;

  List<String> devPaths = [
    'assets/images/dev_theme/angular.png',
    'assets/images/dev_theme/bootstrap.png',
    'assets/images/dev_theme/c.png',
    'assets/images/dev_theme/c#.png',
    'assets/images/dev_theme/c++.png',
    'assets/images/dev_theme/css.png',
    'assets/images/dev_theme/dart.png',
    'assets/images/dev_theme/django.png',
    'assets/images/dev_theme/flutter.png',
    'assets/images/dev_theme/git.png',
    'assets/images/dev_theme/github.png',
    'assets/images/dev_theme/go.png',
    'assets/images/dev_theme/html.png',
    'assets/images/dev_theme/insomnia.png',
    'assets/images/dev_theme/java.png',
    'assets/images/dev_theme/javascript.png',
    'assets/images/dev_theme/kotlin.png',
    'assets/images/dev_theme/linux.png',
    'assets/images/dev_theme/next.png',
    'assets/images/dev_theme/node.png',
    'assets/images/dev_theme/npm.png',
    'assets/images/dev_theme/php.png',
    'assets/images/dev_theme/postman.png',
    'assets/images/dev_theme/python.png',
    'assets/images/dev_theme/react-native.png',
    'assets/images/dev_theme/react.png',
    'assets/images/dev_theme/spring-boot.png',
    'assets/images/dev_theme/sql.png',
    'assets/images/dev_theme/svelte.png',
    'assets/images/dev_theme/swift.png',
    'assets/images/dev_theme/typescript.png',
    'assets/images/dev_theme/vue.png',
  ];

  List<String> animalNames = [

  ];

  GameModel({required this.themeName, this.numberOfPairs = 8});

  List<String> getImagesPath() {
    List<String> baseList = [];
    List<String> imagePaths = [];
    if (themeName == 'Dev') {
      baseList = devPaths;
      baseList.shuffle();
    } 
    if (themeName == 'Animais') {
      baseList = animalNames;
    } 
    if (themeName == 'Turismo') {
    } 
    for (var i = 0; i < numberOfPairs; i++) {
      final imagePath = devPaths[i];
      imagePaths.add(imagePath);
      imagePaths.add(imagePath);
    }
    return imagePaths;
  }
}
