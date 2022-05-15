import 'package:cpe231_nsfw_flutter/src/business_logic/blocs/transfer/bloc/transfer_bloc.dart';
import 'package:cpe231_nsfw_flutter/src/data/repositories/transfer_repository.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/customer/transaction/transfer/widgets/transfer_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../business_logic/blocs/transfer/bloc/transfer_bloc.dart';
import '../../../../../business_logic/blocs/withdraw/bloc/withdraw_bloc.dart';
import '../../../../../data/repositories/atm_repository.dart';
import '../../../../../data/repositories/transfer_repository.dart';
import 'widgets/withdraw_form.dart';

class WithdrawTransaction extends StatelessWidget {
  WithdrawTransaction({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => WithdrawTransaction());
  }

  final _atmRepository = AtmRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _atmRepository,
      child: BlocProvider(
        create: ((context) => WithdrawBloc(atmRepository: _atmRepository)),
        child: Scaffold(
            appBar: AppBar(
              leading: ElevatedButton(
                onPressed: (() => Navigator.pop(context)),
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
            body: WithdrawForm()),
      ),
    );
  }
}
