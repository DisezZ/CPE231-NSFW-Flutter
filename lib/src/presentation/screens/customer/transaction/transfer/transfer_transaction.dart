import '../../../../../business_logic/blocs/transfer/bloc/transfer_bloc.dart';
import '../../../../../data/repositories/transfer_repository.dart';
import 'widgets/transfer_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../business_logic/blocs/transfer/bloc/transfer_bloc.dart';
import '../../../../../data/repositories/transfer_repository.dart';

class TransferTransaction extends StatelessWidget {
  TransferTransaction({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => TransferTransaction());
  }

  final _transferRepository = TransferRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _transferRepository,
      child: BlocProvider(
        create: ((context) => TransferBloc(transferRepository: _transferRepository)),
        child: Scaffold(
            appBar: AppBar(
              leading: ElevatedButton(
                onPressed: (() => Navigator.pop(context)),
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
            body: TransferForm()),
      ),
    );
  }
}
