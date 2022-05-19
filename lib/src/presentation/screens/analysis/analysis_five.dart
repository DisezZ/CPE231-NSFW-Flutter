import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../data/models/analysis.dart';
import '../../../data/repositories/analysis.dart';
import '../../widgets/custom_app_bar.dart';

class AnalysisFiveScreen extends StatelessWidget {
  AnalysisFiveScreen({Key? key}) : super(key: key);

  static Function route() {
    return () => MaterialPageRoute<void>(builder: (_) => AnalysisFiveScreen());
  }

  final analysisRepository = AnalysisRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          back: true,
          title: 'Advance Analysis 5',
        ),
      ),
      body: FutureBuilder(
        future: analysisRepository.fetchFifthAnalysis(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error Loading Advance Analysis');
            } else {
              final res = snapshot.data as AnalysisFiveResponse;
              return DataTable2(
                  showCheckboxColumn: true,
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 600,
                  columns: const [
                    DataColumn2(label: Text('Branch Name')),
                    DataColumn2(label: Text('Membership Name')),
                    DataColumn2(label: Text('Frequency')),
                    DataColumn2(label: Text('Total Amount')),
                  ],
                  rows: res.data
                      .map((e) => DataRow(cells: [
                            DataCell(Text(e.branchName)),
                            DataCell(Text(e.membershipName)),
                            DataCell(Text(e.frequency.toString())),
                            DataCell(Text(e.totalMoney.toString())),
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
