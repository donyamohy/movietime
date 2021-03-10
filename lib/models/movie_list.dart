import 'package:flutter/widgets.dart';

class Movie with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final String duration;
  final String rate;
  final String year;
  final String type;
  bool isFavorite;

  Movie(
      {this.id,
      this.title,
      this.imageUrl,
      this.description,
      this.duration,
      this.rate,
      this.year,
      this.type,
      this.isFavorite = false
      ,});
}



void findMovie(List<Movie> movieList, String searchedName) {
  for (var i = 0; i < movieList.length; i++) {
    if (movieList[i].title == searchedName) {
      print('Using loop: ${movieList[i]}');

      // Found the title, stop the loop
      return;
    }
  }
}

/*void filterByYear(List<Movie> MovieList, String searchedName) {
  for (var i = 0; i < MovieList.length; i++) {
    if (MovieList[i].year == searchedName) {
      print('Using loop: ${MovieList[i]}');

      // Found the title, stop the loop
      return;
    }
  }
}

void filterByRating(List<Movie> MovieList, String searchedName) {
  for (var i = 0; i < MovieList.length; i++) {
    if (MovieList[i].rate == searchedName) {
      print('Using loop: ${MovieList[i]}');

      // Found the title, stop the loop
      return;
    }
  }
}*/

final movieList = [
  Movie(
      id: 'M0001',
      title: 'The Kissing Booth 2',
      imageUrl:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcT3Cuz1VP47OYpYVKc5PbB0LM5zazX43QvkFMdCDBsokUX248jg',
      description:
          'After a romantic summer together, Noah is off to Harvard, and Elle heads back to high school for her senior year.',
      duration: '2h 11m',
      rate: '5.8',
      year: '2020',
      type: 'romantic comedy'),
  Movie(
    id: 'M0002',
    title: 'Mircale in cell no. 7',
    imageUrl:
        'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQunFk382N3k9G7YPHx3l6owq45IXLNH09weu_kRbKjRCnjoDSj',
    description:
        'A story of love between a mentally-ill father who was wrongly accused of murder and his six year old daughter.',
    duration: '2h 12m',
    rate: '8.3',
    year: '2019',
  ),
  Movie(
    id: 'M0003',
    title: 'Bad boys for life',
    imageUrl:
        'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRkPE0us5SIkt9fhXCL4GOD_sLdXrZPiuEZDzJBBNdURla5WIcb',
    description:
        'Detectives Mike Lowrey and Marcus Burnett join the Miami Police Departments special team AMMO to bring down the ruthless Armando, who is on a mission to kill Mike at his mother Isabels orders.',
    duration: '2h 4m',
    rate: '6.6',
    year: '2020',
  ),
  Movie(
    id: 'M0004',
    title: 'الصندوق الأسود',
    imageUrl:
        'https://media.elcinema.com/uploads/_315x420_850c3137cb96005fa07abafcaeb23cfff53e95f2c2c0e6a5ccb16a6e7b345497.jpg',
    description:
        'في إطار من الدراما الممزوجة بالكثير من التشويق والإثارة، يقتحم غريبين منزل ياسمين في مهمة مصيرية لسرقة شيء هام، وتحاول ياسمين الهروب منهما بلا جدوى فإلى أي مدى ستتمكن من الصمود أمامهما؟',
    duration: '1h 30m',
    rate: '6.1',
    year: '2020',
  ),
  Movie(
    id: 'M0005',
    title: 'Trolls World Tour',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyvLny6RPGTHsI8kA2RiEQPyuaF7A9u3x-3reK62yQGrztYz13',
    description:
        'Poppy and Branch discover that there are six different troll tribes scattered over six different lands. Each tribe is also devoted to six different kinds of music -- funk, country, techno, classical, pop and rock. When rockers Queen Barb and King Thrash set out to destroy the other music, Poppy and Branch embark on a daring mission to unite the trolls and save the diverse melodies from becoming extinct.',
    duration: '1h 30m',
    rate: '6.1',
    year: '2020',
  ),
  Movie(
    id: 'M0006',
    title: 'الغسالة',
    imageUrl:
        'https://media.elcinema.com/uploads/_315x420_84ee965efdf7c5b1cec877f520cf55ffd40aaf6e1a557b2e1be29353c68ee965.jpg',
    description:
        'في إطار كوميدي خيالي، تدور الأحداث حول غسالة متطورة يمكن من خلالها السفر عبر الزمن، مما يتسبب في العديد من الصراعات والمفارقات بين مستخدميها في رحلاتهم.',
    duration: '1h 50m',
    rate: '6.2',
    year: '2020',
  ),
  Movie(
    id: 'M0007',
    title: 'The Call',
    imageUrl:
        'https://media.elcinema.com/uploads/_315x420_18d1b21ea4d0436d4220ffc2b7ac1015871a2df72ce20b0ec8687da1f04446cc.jpg',
    description:
        'A group of friends from a small-town in 1987 face their worst nightmare, when they find themselves fighting to save their lives after a tragic accident makes them end up in the home of an evil couple.',
    duration: '1h 35m',
    rate: '3.3',
    year: '2020',
  ),
  Movie(
    id: '0001',
    title: '',
    imageUrl: '',
    description: '',
    duration: '',
    rate: '',
    year: '',
  ),
  Movie(
    id: '0001',
    title: '',
    imageUrl: '',
    description: '',
    duration: '',
    rate: '',
    year: '',
  ),
  Movie(
    id: '0001',
    title: '',
    imageUrl: '',
    description: '',
    duration: '',
    rate: '',
    year: '',
  ),
];
final topRatedlist = [
  Movie(
    id: 'T0001',
    title: 'Jumanji: The Next Level',
    imageUrl:
        'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSxj0M5vbvyeQ8kxcUoRdHMyIjtsQ410YILzsggthfw7GRryQXP',
    description:
        'When Spencer goes missing, the gang returns to Jumanji to travel unexplored territories and help their friend escape the worlds most dangerous game',
    duration: '1h 54m',
    rate: '8.2',
    year: '2019',
  ),
  Movie(
    id: 'T0002',
    title: 'The Meg',
    imageUrl:
        'https://media.elcinema.com/uploads/_315x420_9c7ad8e6031a5e4ae19f8b216909a600bc1f73f9fecff26963d92f146ad293f8.jpg',
    description:
        'Five years after escaping an attack by what he claims was a 70-foot shark, Jonas Taylor, an expert diver and naval captain, must confront his fears to save those trapped in a sunken submersible.',
    duration: '1h 53m',
    rate: '8.1',
    year: '2018',
  ),
  Movie(
    id: 'T0003',
    title: 'Mircale in cell no. 7',
    imageUrl:
        'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQunFk382N3k9G7YPHx3l6owq45IXLNH09weu_kRbKjRCnjoDSj',
    description:
        'A story of love between a mentally-ill father who was wrongly accused of murder and his six year old daughter.',
    duration: '2h 12m',
    rate: '8.3',
    year: '2019',
  ),
  Movie(
    id: 'T0004',
    title: 'Joker',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJKLiEyyz1Q9RC8EBYl3ijr3nuGeyO2ETmwy6Kdq0AQtD0elWD',
    description:
        'An impoverished stand-up comedian is driven insane by a streak of failures and contempt by his society in Gotham City. His life is eventually ruined and he turns into a notorious psychopathic murderer.',
    duration: '2h 02m',
    rate: '8.7',
    year: '2019',
  ),
  Movie(
    id: 'T0005',
    title: 'Me before you',
    imageUrl:
        'https://media.elcinema.com/uploads/_315x420_a74103c2d9239d1d68f59585a0d771e6f30a55246f5ad76ee92ea44c9fe4fe15.jpg',
    description:
        'After becoming unemployed, Louisa Clark is forced to accept one which requires her to take care of Will Traynor, a paralysed man. The two of them soon bond with each other.',
    duration: '1h 50m',
    rate: '8.8',
    year: '2016',
  ),
  Movie(
    id: 'T0006',
    title: 'Aquaman',
    imageUrl:
        'https://media.elcinema.com/uploads/_315x420_f24bbc972e88c58d3d8e2851a879deaefc9a63259f1ff2442d0fcb80c63d719d.jpg',
    description:
        'Born to a human father and an Atlantean mother, Arthur Curry is forced to step into his role as heir to Atlantis to prevent war from breaking out between the two worlds he belongs to.',
    duration: '2h 23m',
    rate: '8.9',
    year: '2018',
  ),
];
