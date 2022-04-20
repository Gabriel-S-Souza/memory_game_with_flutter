import 'dart:math';

class GameModel {
  final String themeName;
  final int numberOfPairs;

  List<String> devNames = [
    'angular',
    'bootstrap',
    'c',
    'c++',
    'c#',
    'css',
    'dart',
    'django',
    'flutter',
    'git',
    'github',
    'go',
    'html',
    'insomnia',
    'java',
    'javascript',
    'kotlin',
    'linux',
    'php',
    'next',
    'node',
    'npm',
    'php',
    'postman',
    'python',
    'react-native',
    'react',
    'spring-boot',
    'sql',
    'svelte',
    'swift',
    'typescript',
    'vue',
  ];

  GameModel({required this.themeName, this.numberOfPairs = 16});

  List<String> getImagesPath() {
    final random = Random();
    List<String> baseList = [];
    List<String> imagePaths = [];
    String? folder;
    if (themeName == 'Dev') {
      folder = 'dev_theme';
      baseList = devNames;
      baseList.shuffle();
    } 
    if (themeName == 'Animais') {
      folder = 'animals_theme';
    } 
    if (themeName == 'Turismo') {
      folder = 'tour_theme';
    } 
    for (var i = 0; i < numberOfPairs; i++) {
      final imagePath = 'assets/images/$folder/${devNames[i]}.png';
      imagePaths.add(imagePath);
      imagePaths.add(imagePath);
    }
    return imagePaths;
  }
}
