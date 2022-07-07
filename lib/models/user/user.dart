// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../models.dart';

class User extends Equatable {
  const User({required this.id, this.email, this.photo, this.name, this.data});

  final String id;
  final String? email;
  final String? name;
  final String? photo;
  final UserData? data;

  static const User empty = User(id: '');

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [id, email, name, photo, data];

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? photo,
    UserData? data,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      data: data ?? this.data,
    );
  }
}
