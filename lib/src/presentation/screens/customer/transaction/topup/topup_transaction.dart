import 'package:cpe231_nsfw_flutter/src/business_logic/blocs/topup/bloc/topup_bloc.dart';
import 'package:cpe231_nsfw_flutter/src/data/repositories/topup_repository.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/customer/transaction/topup/widgets/topup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopupTransaction extends StatelessWidget {
  TopupTransaction({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => TopupTransaction());
  }

  final _topupRepository = TopupRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _topupRepository,
      child: BlocProvider(
        create: ((context) => TopupBloc(topupRepository: _topupRepository)),
        child: Scaffold(
            appBar: AppBar(
              leading: ElevatedButton(
                onPressed: (() => Navigator.pop(context)),
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
            body: TopupForm()),
      ),
    );
  }
}
