import 'package:equatable/equatable.dart';

abstract class ConnectivityState extends Equatable {
  const ConnectivityState(this.state);
  final ConnectivityStateEnums state;
  @override
  List<Object> get props => [state];
}

class AppStarted extends ConnectivityState {
  const AppStarted() : super(ConnectivityStateEnums.APP_STARTED);
}

class InternetAvailable extends ConnectivityState {
  const InternetAvailable() : super(ConnectivityStateEnums.INTERNET_AVAILABLE);
}

class InternetUnavailable extends ConnectivityState {
  const InternetUnavailable()
      : super(ConnectivityStateEnums.INTERNET_UNAVAILABLE);
}

enum ConnectivityStateEnums {
  APP_STARTED,
  INTERNET_AVAILABLE,
  INTERNET_UNAVAILABLE
}
