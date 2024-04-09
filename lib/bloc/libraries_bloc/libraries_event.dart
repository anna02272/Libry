part of 'libraries_bloc.dart';

@immutable
sealed class LibrariesEvent{}

class LibrairesFetched extends LibrariesEvent {
  final String platform; 

  LibrairesFetched(this.platform);
  
  @override
  List<Object?> get props => [platform];
}
