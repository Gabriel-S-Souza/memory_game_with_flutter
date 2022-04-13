class GameTheme {
  final String themeName;
  
  GameTheme(this.themeName);

  List<String> devNames = [
    'angular', 'bootstrap', 'c', 'c++', 'c#', 'css', 'dart', 'django', 'flutter', 
    'git', 'github', 'go', 'html', 'insomnia', 'java', 'javascript', 'kotlin', 'linux',
    'php', 'next', 'node', 'npm', 'php', 'postman', 'python', 'react-native', 'react', 
    'spring-boot', 'sql', 'svelte', 'swift', 'typescript', 'vue',
  ];

  String? folderName;

  List<String> getImagePath() {
    if (themeName == 'Dev') {
      folderName = 'dev_theme';
      return devNames.map((name) => 'assets/images/$folderName/$name.png').toList();
    } 
    return [];
    
    // else if (themeName == 'Animais') {
    //   folderName = 'animals_theme';
    // } else if (themeName == 'Turismo') {
    //   folderName = 'travel_theme';
    // }

    
  }
}