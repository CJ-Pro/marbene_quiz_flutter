import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'test.dart';

class TheoryTest extends Test {
  int elapsedTimeInSeconds;
  bool isFlagged;
  bool isTimed;
  bool isTutored;
  List<String> writtenAnswers;
  int totalAnswered;
  int totalCorrect;
  int id;
  TheoryTest({
    this.elapsedTimeInSeconds,
    this.isFlagged,
    this.isTimed,
    this.isTutored,
    this.writtenAnswers,
    this.totalAnswered,
    this.totalCorrect,
    this.id,
  }) : super(id: id);

  TheoryTest copyWith({
    int elapsedTimeInSeconds,
    bool isFlagged,
    bool isTimed,
    bool isTutored,
    List<String> writtenAnswers,
    int totalAnswered,
    int totalCorrect,
    int id,
  }) {
    return TheoryTest(
      elapsedTimeInSeconds: elapsedTimeInSeconds ?? this.elapsedTimeInSeconds,
      isFlagged: isFlagged ?? this.isFlagged,
      isTimed: isTimed ?? this.isTimed,
      isTutored: isTutored ?? this.isTutored,
      writtenAnswers: writtenAnswers ?? this.writtenAnswers,
      totalAnswered: totalAnswered ?? this.totalAnswered,
      totalCorrect: totalCorrect ?? this.totalCorrect,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'elapsedTimeInSeconds': elapsedTimeInSeconds,
      'isFlagged': isFlagged,
      'isTimed': isTimed,
      'isTutored': isTutored,
      'writtenAnswers': writtenAnswers,
      'totalAnswered': totalAnswered,
      'totalCorrect': totalCorrect,
      'id': id,
    };
  }

  factory TheoryTest.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TheoryTest(
      elapsedTimeInSeconds: map['elapsedTimeInSeconds'],
      isFlagged: map['isFlagged'],
      isTimed: map['isTimed'],
      isTutored: map['isTutored'],
      writtenAnswers: List<String>.from(map['writtenAnswers']),
      totalAnswered: map['totalAnswered'],
      totalCorrect: map['totalCorrect'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TheoryTest.fromJson(String source) =>
      TheoryTest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TheoryTest(elapsedTimeInSeconds: $elapsedTimeInSeconds, isFlagged: $isFlagged, isTimed: $isTimed, isTutored: $isTutored, writtenAnswers: $writtenAnswers, totalAnswered: $totalAnswered, totalCorrect: $totalCorrect, id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TheoryTest &&
        o.elapsedTimeInSeconds == elapsedTimeInSeconds &&
        o.isFlagged == isFlagged &&
        o.isTimed == isTimed &&
        o.isTutored == isTutored &&
        listEquals(o.writtenAnswers, writtenAnswers) &&
        o.totalAnswered == totalAnswered &&
        o.totalCorrect == totalCorrect &&
        o.id == id;
  }

  @override
  int get hashCode {
    return elapsedTimeInSeconds.hashCode ^
        isFlagged.hashCode ^
        isTimed.hashCode ^
        isTutored.hashCode ^
        writtenAnswers.hashCode ^
        totalAnswered.hashCode ^
        totalCorrect.hashCode ^
        id.hashCode;
  }

  @override
  int get currentElapsedTimeInSeconds => currentElapsedTimeInSeconds;

  @override
  List<String> get getAnswer => writtenAnswers;

  @override
  int get getTotalAnswered => totalAnswered;

  @override
  int get getTotalCorrect => totalCorrect;

  @override
  bool get hasFlagged => isFlagged;

  @override
  bool get hasTimed => hasTimed;

  @override
  bool get hasTutored => isTutored;
}
