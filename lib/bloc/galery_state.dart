part of 'galery_bloc.dart';

abstract class GaleryState extends Equatable {
  const GaleryState();
  
  @override
  List<Object> get props => [];
}

class GaleryInitial extends GaleryState {
  @override
  List<Object> get props => [];
}

class GaleryLoaded extends GaleryState{
  final List<GaleryModel> galery;

  GaleryLoaded(this.galery);

  @override
  List<Object> get props => [galery];
}
