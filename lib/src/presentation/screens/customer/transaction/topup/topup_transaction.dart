import '../../../../../business_logic/blocs/topup/bloc/topup_bloc.dart';
import '../../../../../data/repositories/topup_repository.dart';
import '../../../../widgets/custom_app_bar.dart';
import 'widgets/topup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopupTransaction extends StatelessWidget {
  TopupTransaction({Key? key}) : super(key: key);

  static Function route() {
    return () => MaterialPageRoute<void>(builder: (_) => TopupTransaction());
  }

  final _topupRepository = TopupRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _topupRepository,
      child: BlocProvider(
        create: ((context) => TopupBloc(topupRepository: _topupRepository)),
        child: const Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: CustomAppBar(
                back: true,
                title: 'Topup',
              ),
            ),
            body: TopupForm()),
      ),
    );
  }
}
