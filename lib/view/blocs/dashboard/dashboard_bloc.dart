import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novastrid/data/dashboard_repository.dart';

import '../../../data/model/dashboard_model.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardSuccess dashboardSuccess = DashboardSuccess();
  DashboardBloc() : super(DashboardInitial()) {
    on<FetchUsers>(_fetchUser);
  }

  Future<void> _fetchUser(
      FetchUsers event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());
    DashboardModel dashboardModel = await DashboardRepository().fetchUser();
    emit(dashboardSuccess..listData = dashboardModel.users ?? []);
  }
}
