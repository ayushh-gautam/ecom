part of 'offline_cubit.dart';

sealed class OfflineState extends Equatable {
  const OfflineState();

  @override
  List<Object> get props => [];
}

final class OfflineInitial extends OfflineState {}
