import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../data/models/analysis.dart';
import '../../../data/repositories/analysis.dart';
import '../../widgets/custom_app_bar.dart';

class AnalysisThreeScreen extends StatelessWidget {
  AnalysisThreeScreen({Key? key}) : super(key: key);

  static Function route() {
    return () => MaterialPageRoute<void>(builder: (_) => AnalysisThreeScreen());
  }

  final analysisRepository = AnalysisRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          back: true,
          title: 'Advance Analysis 3',
        ),
      ),
      body: FutureBuilder(
        future: analysisRepository.fetchThirdAnalysis(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error Loading Advance Analysis');
            } else {
              final res = snapshot.data as AnalysisThreeResponse;
              return DataTable2(
                  showCheckboxColumn: true,
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 650,
                  columns: const [
                    DataColumn2(label: Text('Transfer Transaction Id')),
                    DataColumn2(label: Text('First Name')),
                    DataColumn2(label: Text('Last Name')),
                    DataColumn2(label: Text('Bank Name')),
                  ],
                  rows: res.data
                      .map((e) => DataRow(cells: [
                            DataCell(Text(e.transferTransactionId.toString())),
                            DataCell(Text(e.firstName)),
                            DataCell(Text(e.lastName)),
                            DataCell(Text(e.bankName.toString())),
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
