import 'dart:math';

class GameController {
  final String themeName;
  final int numberOfPairs;
  int pairsCount = 0;

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

  GameController(this.themeName, this.numberOfPairs);

  List<String> getImagesPath() {
    final random = Random();
    List<String> imagePaths = [];
    String? folder;
    if (themeName == 'Dev') folder = 'dev_theme';
    if (themeName == 'Animais') folder = 'animals_theme';
    if (themeName == 'Turismo') folder = 'tour_theme';
    for (var i = 1; i < numberOfPairs; i++) {
      final index = random.nextInt(devNames.length);
      final imagePath = 'assets/images/$folder/${devNames[index]}.png';
      devNames.removeAt(index);
      imagePaths.add(imagePath);
    }
    return imagePaths;
  }
}
