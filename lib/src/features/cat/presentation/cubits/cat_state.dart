part of 'cat_cubit.dart';

enum StateEnum {
  unKnow,
  loading,
  success,
  error;

  bool get isError => this == error;
  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
  bool get isUnKnow => this == unKnow;
}

class CatState extends Equatable {
  const CatState({
    this.state = StateEnum.unKnow,
    this.breeds = const [],
  });

  final StateEnum state;
  final List<BreedModel> breeds;

  CatState copyWith({
    StateEnum? state,
    List<BreedModel>? breeds,
  }) {
    return CatState(
      state: state ?? this.state,
      breeds: breeds ?? this.breeds,
    );
  }

  @override
  List<Object?> get props => [
    state,
    breeds,
  ];
}
