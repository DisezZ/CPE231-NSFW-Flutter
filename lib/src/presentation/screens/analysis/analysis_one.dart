import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../data/models/analysis.dart';
import '../../../data/repositories/analysis.dart';
import '../../widgets/custom_app_bar.dart';

class AnalysisOneScreen extends StatelessWidget {
  AnalysisOneScreen({Key? key}) : super(key: key);

  static Function route() {
    return () => MaterialPageRoute<void>(builder: (_) => AnalysisOneScreen());
  }

  final analysisRepository = AnalysisRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          back: true,
          title: 'Advance Analysis 1',
        ),
      ),
      body: FutureBuilder(
        future: analysisRepository.fetchFirstAnalysis(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error Loading Advance Analysis');
            } else {
              final res = snapshot.data as AnalysisOneResponse;
              return DataTable2(
                  showCheckboxColumn: true,
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 800,
                  columns: const [
                    DataColumn2(label: Text('Membership Name')),
                    DataColumn2(label: Text('Total Customers')),
                    DataColumn2(label: Text('Customer Id')),
                    DataColumn2(label: Text('First Name')),
                    DataColumn2(label: Text('Last Name')),
                    DataColumn2(label: Text('Balance')),
                  ],
                  rows: res.data
                      .map((e) => DataRow(cells: [
                            DataCell(Text(e.membershipName)),
                            DataCell(Text(e.totalCustomers.toString())),
                            DataCell(Text(e.customerId.toString())),
                            DataCell(Text(e.firstName)),
                            DataCell(Text(e.lastName)),
                            DataCell(Text(e.balance.toString())),
                          ]))
                      .toList());
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
