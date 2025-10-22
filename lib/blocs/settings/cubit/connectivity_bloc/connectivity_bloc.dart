import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:my_doctor_house_mobile_app/blocs/settings/cubit/connectivity_bloc/connectivity_event.dart';
import 'package:my_doctor_house_mobile_app/blocs/settings/cubit/connectivity_bloc/connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  late StreamSubscription subscription;

  @override
  ConnectivityBloc(super.initialState);

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }

  Stream<List<ConnectivityResult>> mapEventToState(
      List<ConnectivityResult> connectivityResult) async* {
    if (connectivityResult is AppStarted) {
      subscription = Connectivity().onConnectivityChanged.listen(
        (event) {
          if (connectivityResult.contains(ConnectivityResult.mobile)) {
            const InternetAvailable();
          } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
            const InternetAvailable();
          } else {
            const InternetUnavailable();
          }
        },
      );
    }
  }
}
