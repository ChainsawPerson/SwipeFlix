class Movie {
  final int title_id;
  final String title_primaryTitle;
  final String? title_genre;
  final String? title_posterURL;
  final String? title_details;
  final String? title_imdbLink;

  const Movie({
    required this.title_id,
    required this.title_primaryTitle,
    this.title_genre,
    this.title_posterURL,
    this.title_details,
    this.title_imdbLink,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title_id: json['title_id'],
        title_primaryTitle: json['title_primaryTitle'],
        title_genre: json['title_genre'],
        title_posterURL: json['title_posterURL'],
        title_details: json['title_details'],
        title_imdbLink: json['title_imdbLink'],
      );

  Map<String, dynamic> toJson() => {
        'title_id': title_id,
        'title_primaryTitle': title_primaryTitle,
        'title_genre': title_genre,
        'title_posterURL': title_posterURL,
        'title_details': title_details,
        'title_imdbLink': title_imdbLink,
      };
}

class LikedList {
  final int title_title_id;
  final String like_timestamp;

  const LikedList({
    required this.title_title_id,
    required this.like_timestamp,
  });

  factory LikedList.fromJson(Map<String, dynamic> json) => LikedList(
      title_title_id: json['title_title_id'],
      like_timestamp: json['like_timestamp']);

  Map<String, dynamic> toJson() => {
        'title_title_id': title_title_id,
        'like_timestamp': like_timestamp,
      };
}

class DislikedList {
  final int title_title_id;
  final String dislike_timestamp;

  const DislikedList({
    required this.title_title_id,
    required this.dislike_timestamp,
  });

  factory DislikedList.fromJson(Map<String, dynamic> json) => DislikedList(
      title_title_id: json['title_title_id'],
      dislike_timestamp: json['dislike_timestamp']);

  Map<String, dynamic> toJson() => {
        'title_title_id': title_title_id,
        'dislike_timestamp': dislike_timestamp,
      };
}

class WatchList {
  final int title_title_id;
  final String watchList_timestamp;

  const WatchList({
    required this.title_title_id,
    required this.watchList_timestamp,
  });

  factory WatchList.fromJson(Map<String, dynamic> json) => WatchList(
      title_title_id: json['title_title_id'],
      watchList_timestamp: json['watchList_timestamp']);

  Map<String, dynamic> toJson() => {
        'title_title_id': title_title_id,
        'watchList_timestamp': watchList_timestamp,
      };
}
