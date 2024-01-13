import 'package:intl/intl.dart';

class Movie {
  final String title_id;
  final String title_type;
  final String title_primaryTitle;
  final String title_originalTitle;
  final int title_isAdult;
  final int title_startYear;
  final int? title_endYear;
  final int? title_runtimeMinutes;
  final String title_genre;
  final String title_posterURL;

  const Movie({
    required this.title_id,
    required this.title_type,
    required this.title_primaryTitle,
    required this.title_originalTitle,
    required this.title_isAdult,
    required this.title_startYear,
    this.title_endYear,
    this.title_runtimeMinutes,
    required this.title_genre,
    required this.title_posterURL,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title_id: json['title_id'],
        title_type: json['title_type'],
        title_primaryTitle: json['title_primaryTitle'],
        title_originalTitle: json['title_originalTitle'],
        title_isAdult: json['title_isAdult'],
        title_startYear: json['title_startYear'],
        title_endYear: json['title_endYear'],
        title_runtimeMinutes: json['title_runtimeMinutes'],
        title_genre: json['title_genre'],
        title_posterURL: json['title_posterURL'],
      );

  Map<String, dynamic> toJson() => {
        'title_id': title_id,
        'title_type': title_type,
        'title_primaryTitle': title_primaryTitle,
        'title_originalTitle': title_originalTitle,
        'title_isAdult': title_isAdult,
        'title_startYear': title_startYear,
        'title_endYear': title_endYear,
        'title_runtimeMinutes': title_runtimeMinutes,
        'title_genre': title_genre,
        'title_posterURL': title_posterURL,
      };
}

class User {
  final String user_id;

  const User({required this.user_id});

  factory User.fromJson(Map<String, dynamic> json) => User(
        user_id: json['user_id'],
      );

  Map<String, dynamic> toJson() => {
        'user_id': user_id,
      };
}

class LikedList {
  final String user_user_id;
  final String title_title_id;
  final String like_timestamp;

  const LikedList({
    required this.user_user_id,
    required this.title_title_id,
    required this.like_timestamp,
  });

  factory LikedList.fromJson(Map<String, dynamic> json) => LikedList(
      user_user_id: json['user_user_id'],
      title_title_id: json['title_title_id'],
      like_timestamp: json['like_timestamp']);

  Map<String, dynamic> toJson() => {
        'user_user_id': user_user_id,
        'title_title_id': title_title_id,
        'like_timestamp': like_timestamp,
      };
}

class DislikedList {
  final String user_user_id;
  final String title_title_id;
  final String dislike_timestamp;

  const DislikedList({
    required this.user_user_id,
    required this.title_title_id,
    required this.dislike_timestamp,
  });

  factory DislikedList.fromJson(Map<String, dynamic> json) => DislikedList(
      user_user_id: json['user_user_id'],
      title_title_id: json['title_title_id'],
      dislike_timestamp: json['dislike_timestamp']);

  Map<String, dynamic> toJson() => {
        'user_user_id': user_user_id,
        'title_title_id': title_title_id,
        'dislike_timestamp': dislike_timestamp,
      };
}

class WatchList {
  final String user_user_id;
  final String title_title_id;
  final String watchList_timestamp;

  const WatchList({
    required this.user_user_id,
    required this.title_title_id,
    required this.watchList_timestamp,
  });

  factory WatchList.fromJson(Map<String, dynamic> json) => WatchList(
      user_user_id: json['user_user_id'],
      title_title_id: json['title_title_id'],
      watchList_timestamp: json['watchList_timestamp']);

  Map<String, dynamic> toJson() => {
        'user_user_id': user_user_id,
        'title_title_id': title_title_id,
        'watchList_timestamp': watchList_timestamp,
      };
}
