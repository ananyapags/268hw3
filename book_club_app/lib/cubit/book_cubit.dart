import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/book.dart';

class BookState extends Equatable {
  final List<Book> books;
  final bool sortByTitleEnabled;
  final bool sortByAuthorEnabled;

  const BookState({
    required this.books,
    this.sortByTitleEnabled = false,
    this.sortByAuthorEnabled = false,
  });

  @override
  List<Object> get props => [books, sortByTitleEnabled, sortByAuthorEnabled];

  // CopyWith method to simplify state updates
  BookState copyWith({
    List<Book>? books,
    bool? sortByTitleEnabled,
    bool? sortByAuthorEnabled,
  }) {
    return BookState(
      books: books ?? this.books,
      sortByTitleEnabled: sortByTitleEnabled ?? this.sortByTitleEnabled,
      sortByAuthorEnabled: sortByAuthorEnabled ?? this.sortByAuthorEnabled,
    );
  }
}

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookState(books: []));

  void initBooks() {
    final books = [
      Book(
        title: "Dune",
        author: "Frank Herbert",
        description:
            "Set on the desert planet of Arrakis, Dune tells the story of Paul Atreides, a young noble who becomes embroiled in a conflict over the most valuable substance in the universe: the spice melange. The novel explores themes of power, politics, religion, and ecology, creating a richly detailed and immersive universe.\n\nAs Paul’s destiny unfolds, he transforms into a messianic figure whose choices will shape the future of humanity and the planet itself. Dune is a cornerstone of science fiction, blending complex characters and intricate storytelling with timeless questions about human ambition and survival.",
        imagePath: "assets/dune.jpg",
      ),
      Book(
        title: "Neuromancer",
        author: "William Gibson",
        description:
            "William Gibson's Neuromancer is the definitive cyberpunk novel, introducing readers to a gritty, neon-lit future dominated by cyberspace. The story follows Case, a washed-up computer hacker, who is hired by a mysterious employer for one last job: to infiltrate a powerful artificial intelligence. Packed with high-tech intrigue and criminal underworlds, the novel immerses readers in a revolutionary vision of the digital age.\n\nNeuromancer doesn't just predict the internet—it defines it, weaving a tale that explores the boundaries between humanity and technology. It’s a fast-paced, mind-bending adventure that questions the cost of progress and the value of human connection.",
        imagePath: "assets/neuromancer.jpg",
      ),
      Book(
        title: "The Left Hand of Darkness",
        author: "Ursula K. Le Guin",
        description:
            "The Left Hand of Darkness takes readers to the distant planet of Gethen, where the inhabitants are ambisexual beings capable of assuming male or female characteristics. The story follows Genly Ai, a human emissary sent to forge an alliance with the planet’s nations, as he struggles to understand a culture so different from his own.\n\nLe Guin masterfully blends anthropology, sociology, and science fiction to challenge conventional notions of gender and identity. Through a tale of survival and trust in the frozen wilderness, The Left Hand of Darkness offers a profound meditation on what it means to be human.",
        imagePath: "assets/lhod.jpg",
      ),
      Book(
        title: "Foundation",
        author: "Isaac Asimov",
        description:
            "Isaac Asimov's Foundation begins an epic saga about the decline and fall of a galactic empire and the visionary efforts to preserve its knowledge. Hari Seldon, a mathematician, develops the science of psychohistory, which predicts the collapse of civilization and the onset of a dark age lasting thousands of years. To mitigate the damage, he establishes the Foundation, a repository of humanity’s greatest achievements.\n\nThrough sweeping narrative arcs and philosophical depth, Asimov explores the interplay between science, politics, and human behavior. Foundation is both a gripping tale of interstellar intrigue and a meditation on the cyclical nature of history.",
        imagePath: "assets/foundation.jpg",
      ),
      Book(
        title: "Hyperion",
        author: "Dan Simmons",
        description:
            "Hyperion is a space opera that follows seven pilgrims as they journey to the mysterious world of Hyperion to confront the enigmatic Shrike, a godlike entity rumored to grant wishes—or bring doom. Each pilgrim tells their own story, weaving a tapestry of love, faith, war, and obsession that defines the universe they inhabit.\n\nDan Simmons masterfully crafts a richly layered narrative that combines elements of mystery, horror, and speculative fiction. Hyperion challenges readers to consider the nature of time, divinity, and human purpose, making it one of the most thought-provoking works in science fiction.",
        imagePath: "assets/hyperion.jpg",
      ),
    ];
    emit(state.copyWith(books: books));
  }

  void sortByTitle() {
    final sortedBooks = List<Book>.from(state.books)
      ..sort((a, b) => a.title.compareTo(b.title));
    emit(state.copyWith(
      books: sortedBooks,
      sortByTitleEnabled: true,
      sortByAuthorEnabled: false,
    ));
  }

  void sortByAuthor() {
    final sortedBooks = List<Book>.from(state.books)
      ..sort((a, b) => a.author.compareTo(b.author));
    emit(state.copyWith(
      books: sortedBooks,
      sortByTitleEnabled: false,
      sortByAuthorEnabled: true,
    ));
  }
}
