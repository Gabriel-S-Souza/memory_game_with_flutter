class GameModel {
  final String themeName;
  final int numberOfPairs;
  final List<String> playerNames;

  GameModel({
    required this.themeName,
    this.numberOfPairs = 8,
    this.playerNames = const ['Player 1', 'Player 2'],
  });

  List<String> devPaths = [
    'assets/images/dev_theme/angular.png',
    'assets/images/dev_theme/axios.png',
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
    'assets/images/dev_theme/laravel.png',
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
    'assets/images/dev_theme/yarn.png',
  ];

  List<String> animalPaths = [
    'assets/images/animals_theme/aguia.jpg',
    'assets/images/animals_theme/arara.jpg',
    'assets/images/animals_theme/baleia.jpg',
    'assets/images/animals_theme/boi.jpg',
    'assets/images/animals_theme/cachorro.jpg',
    'assets/images/animals_theme/cachorro2.jpg',
    'assets/images/animals_theme/caranguejo.jpg',
    'assets/images/animals_theme/cavalo.jpg',
    'assets/images/animals_theme/coala.jpg',
    'assets/images/animals_theme/cobra.jpg',
    'assets/images/animals_theme/coruja.jpg',
    'assets/images/animals_theme/elefante.jpg',
    'assets/images/animals_theme/ema.jpg',
    'assets/images/animals_theme/flamingo.jpg',
    'assets/images/animals_theme/galinha.jpg',
    'assets/images/animals_theme/gato.jpg',
    'assets/images/animals_theme/gato2.jpg',
    'assets/images/animals_theme/girafa.jpg',
    'assets/images/animals_theme/guaxinim.jpg',
    'assets/images/animals_theme/hipopotamo.jpg',
    'assets/images/animals_theme/iguana.jpg',
    'assets/images/animals_theme/jumento.jpg',
    'assets/images/animals_theme/lagarto.jpg',
    'assets/images/animals_theme/leao-marinho.jpg',
    'assets/images/animals_theme/leao.jpg',
    'assets/images/animals_theme/lhama.jpg',
    'assets/images/animals_theme/lobo.jpg',
    'assets/images/animals_theme/macaco.jpg',
    'assets/images/animals_theme/macaco2.jpg',
    'assets/images/animals_theme/papagaio.jpg',
    'assets/images/animals_theme/passaro.jpg',
    'assets/images/animals_theme/pato.jpg',
    'assets/images/animals_theme/peixe.jpg',
    'assets/images/animals_theme/pinguin.jpg',
    'assets/images/animals_theme/raposa.jpg',
    'assets/images/animals_theme/rato.jpg',
    'assets/images/animals_theme/sapo.jpg',
    'assets/images/animals_theme/suricato.jpg',
    'assets/images/animals_theme/tartaruga.jpg',
    'assets/images/animals_theme/tigre.jpg',
    'assets/images/animals_theme/tucano.jpg',
    'assets/images/animals_theme/urso-panda.jpg',
    'assets/images/animals_theme/urso-polar.jpg',
    'assets/images/animals_theme/vaca.jpg',
  ];

  List<String> landscapePaths = [
    'assets/images/landscape_theme/aurora-boreal.jpg',
    'assets/images/landscape_theme/canyon.jpg',
    'assets/images/landscape_theme/casa-da-opera.jpg',
    'assets/images/landscape_theme/cataratas-do-iguacu.jpg',
    'assets/images/landscape_theme/chichen-itza.jpg',
    'assets/images/landscape_theme/coliseu.jpg',
    'assets/images/landscape_theme/cristo-redentor.jpg',
    'assets/images/landscape_theme/egito.jpg',
    'assets/images/landscape_theme/grande-muralha.jpg',
    'assets/images/landscape_theme/gruta-do-lago-azul.jpg',
    'assets/images/landscape_theme/holanda.jpg',
    'assets/images/landscape_theme/ice-canyon.jpeg',
    'assets/images/landscape_theme/lago-peyto.jpg',
    'assets/images/landscape_theme/lake-powell.jpg',
    'assets/images/landscape_theme/londres.jpg',
    'assets/images/landscape_theme/maldivas.jpg',
    'assets/images/landscape_theme/maldivas2.jpg',
    'assets/images/landscape_theme/niagra.jpg',
    'assets/images/landscape_theme/parque-jasper.jpg',
    'assets/images/landscape_theme/peninsula-yucatan.jpg',
    'assets/images/landscape_theme/singapore.jpg',
    'assets/images/landscape_theme/svartifoss.jpg',
    'assets/images/landscape_theme/taj-mahal.jpg',
    'assets/images/landscape_theme/torre-de-pizza.jpg',
    'assets/images/landscape_theme/vale-verzasca.jpg',
  ];

  List<String> getImagesPath() {
    List<String> baseList = [];
    List<String> imagePaths = [];
    if (themeName == 'Dev') {
      baseList = devPaths;
      baseList.shuffle();
    }
    if (themeName == 'Animais') {
      baseList = animalPaths;
      baseList.shuffle();
    }
    if (themeName == 'Paisagens') {
      baseList = landscapePaths;
      baseList.shuffle();
    }
    for (var i = 0; i < numberOfPairs; i++) {
      final imagePath = baseList[i];
      imagePaths.add(imagePath);
      imagePaths.add(imagePath);
    }
    return imagePaths;
  }
}
