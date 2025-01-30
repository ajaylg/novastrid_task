import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novastrid/view/blocs/dashboard/dashboard_bloc.dart';
import 'package:responsive_table/responsive_table.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late DashboardBloc dashboardBloc;
  late List<DatatableHeader> _headers;
  @override
  void initState() {
    dashboardBloc = BlocProvider.of(context);
    _headers = [
      DatatableHeader(
          text: "ID", value: "id", show: true, textAlign: TextAlign.center),
      DatatableHeader(
          text: "Name",
          value: "firstName",
          show: true,
          textAlign: TextAlign.center),
    ];
    dashboardBloc.add(FetchUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardBloc, DashboardState>(
        bloc: dashboardBloc,
        builder: (context, state) {
          if (state is DashboardLoading || state is DashboardInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DashboardSuccess) {
            // List<Map<String, dynamic>> _sources =
            //     state.listData!.map((e) => {"":}).toList();
            return ResponsiveDatatable(
              headers: _headers,
              source: [],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
