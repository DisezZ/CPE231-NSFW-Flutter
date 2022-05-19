import '../../../../../business_logic/blocs/transfer/bloc/transfer_bloc.dart';
import '../../../../../data/repositories/transfer_repository.dart';
import '../../../../widgets/custom_app_bar.dart';
import 'widgets/transfer_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../business_logic/blocs/transfer/bloc/transfer_bloc.dart';
import '../../../../../data/repositories/transfer_repository.dart';

class TransferTransaction extends StatelessWidget {
  TransferTransaction({Key? key}) : super(key: key);

  static Function route() {
    return () => MaterialPageRoute<void>(builder: (_) => TransferTransaction());
  }

  final _transferRepository = TransferRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _transferRepository,
      child: BlocProvider(
        create: ((context) =>
            TransferBloc(transferRepository: _transferRepository)),
        child: const Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: CustomAppBar(
                back: true,
                title: 'Transfer',
              ),
            ),
            body: TransferForm()),
      ),
    );
  }
}
