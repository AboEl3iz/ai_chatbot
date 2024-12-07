part of 'ai_cubit.dart';

@immutable
sealed class AiState {}

final class AiInitial extends AiState {}

final class AiLoading extends AiState {}

final class AiSuccess extends AiState {
   List<String> data = [];
   List<String> user = [];

  AiSuccess({required this.data ,required this.user});
}

final class AiFailure extends AiState {
  final String message;

  AiFailure({required this.message});
}
