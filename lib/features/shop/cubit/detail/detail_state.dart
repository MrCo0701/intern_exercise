class DetailState {
  final int number;
  final bool isFavorite;

  DetailState({required this.number, required this.isFavorite});

  DetailState copyWith({int? number, bool? isFavorite}) {
    return DetailState(
      number: number ?? this.number,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
