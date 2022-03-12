import '../domain/repositories/accounts_repository.dart';
import 'api/network_service/services/accounts_api_service.dart';

class AccountsApi extends AccountsRepository {
  late final AccountsService _accountsService;

  AccountsApi() {
    _accountsService = AccountsService();
  }

  @override
  Future createSavingEnvelope(
      {required String envelopeName,
      required num targetAmount,
      required DateTime targetDate}) {
    // TODO: implement createSavingEnvelope
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteSavingEnvelope(
      {required String id, String? closeReasonId, String? customReason}) {
    // TODO: implement deleteSavingEnvelope
    throw UnimplementedError();
  }

  @override
  Future<bool> editSavingEnvelope(
      {required String id,
      required String name,
      required num targetAmount,
      required DateTime targetDate}) {
    // TODO: implement editSavingEnvelope
    throw UnimplementedError();
  }

  @override
  Future getAccountById(String id) {
    // TODO: implement getAccountById
    throw UnimplementedError();
  }

  @override
  Future getAccountsLimit(
      {required String iban,
      required String bic,
      required int accountIdentifier}) {
    // TODO: implement getAccountsLimit
    throw UnimplementedError();
  }

  @override
  Future getAccountsList() {
    // TODO: implement getAccountsList
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, String>>> getActions() {
    // TODO: implement getActions
    throw UnimplementedError();
  }

  @override
  Future<List> getCloseReasons() {
    // TODO: implement getCloseReasons
    throw UnimplementedError();
  }

  @override
  Future orderVirtualCard() {
    // TODO: implement orderVirtualCard
    throw UnimplementedError();
  }

// @override
// Future<AccountListModel> getAccountsList() async {
//   var response = await _accountsService.getAccounts();
//
//   List<AccountDetailModel> accounts = [];
//   if (response != null && response.data != null) {
//     var result = AccountListMapper.fromApi(response.data).toModel();
//
//     result.items.forEach((item) {
//       if (item.accountType == AccountTypeEnum.SAVING_ENVELOPE &&
//           accounts.indexWhere((el) =>
//                   el.accountType == AccountTypeEnum.SAVING_ENVELOPE) !=
//               -1) {
//         return;
//       }
//
//       accounts.add(item);
//     });
//
//     return AccountListModel(
//       totalBalance: result.totalBalance,
//       items: accounts,
//     );
//   } else
//     throw Exception('Accounts list is empty');
// }
//
// @override
// Future<UserCard> orderVirtualCard() async {
//   var response = await _accountsService.createVirtualAccount();
//
//   if (response != null && response.data != null) {
//     UserCard account = UserCard.fromJson(response.data);
//
//     return account;
//   } else
//     throw Exception('Account is empty');
// }
//
// @override
// Future<AccountDetailModel> getAccountById(String id) async {
//   var response = await _accountsService.getAccounts();
//
//   if (response != null && response.data != null) {
//     var result = AccountListMapper.fromApi(response.data).toModel();
//
//     AccountDetailModel account =
//         result.items.firstWhere((element) => element.id == id);
//
//     return account;
//   } else
//     throw Exception('Account is empty');
// }
//
// @override
// Future<List<Map<String, String>>> getActions() async {
//   await Future.delayed(Duration(milliseconds: 1000));
//
//   return [
//     {
//       'title': 'Headline',
//       'subTitle':
//           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae mauris eros. Mauris sagittis augue',
//     },
//     {
//       'title': 'Headline',
//       'subTitle':
//           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae mauris eros. Mauris sagittis augue',
//     },
//   ];
// }
//
// @override
// Future<SavingEnvelopeModel> createSavingEnvelope({
//   required String envelopeName,
//   required num targetAmount,
//   required DateTime targetDate,
// }) async {
//   var response = await _accountsService.createSavingEnvelope(
//     envelopeName: envelopeName,
//     targetAmount: targetAmount,
//     targetDate: targetDate,
//   );
//
//   if (response != null && response.data != null) {
//     var envelope = AccountMapper.fromApi(response.data).toModel();
//
//     return envelope as SavingEnvelopeModel;
//   } else
//     throw Exception('Envelope is empty');
// }
//
// @override
// Future<bool> editSavingEnvelope({
//   required String id,
//   required String name,
//   required num targetAmount,
//   required DateTime targetDate,
// }) async {
//   var response = await _accountsService.editSavingEnvelope(
//     id: id,
//     name: name,
//     targetAmount: targetAmount,
//     targetDate: targetDate,
//   );
//
//   if (response != null && response.data != null) {
//     return true;
//   } else
//     throw Exception('Envelope is not edited');
// }
//
// @override
// Future<List<CloseEnvelopeReasonsModel>> getCloseReasons() async {
//   var response = await _accountsService.getCloseReasons();
//
//   List<CloseEnvelopeReasonsModel> closeReasonsList = [];
//   if (response != null && response.data != null) {
//     for (int i = 0; i < response.data.length; i++) {
//       var closeReason =
//           CloseEnvelopeReasonsMapper.fromApi(response.data[i]).toModel();
//       closeReasonsList.add(closeReason);
//     }
//
//     return closeReasonsList;
//   } else
//     throw Exception('Close reasons list is empty');
// }
//
// @override
// Future<bool?> deleteSavingEnvelope({
//   required String id,
//   String? closeReasonId,
//   String? customReason,
// }) async {
//   var response = await _accountsService.deleteSavingEnvelope(
//     id: id,
//     closeReasonId: closeReasonId,
//     customReason: customReason,
//   );
//
//   if (response != null && response.data != null) {
//     return true;
//   } else
//     throw Exception('Envelope is not deleted');
// }
//
// @override
// Future<AccountLimitsModel> getAccountsLimit({
//   required String iban,
//   required String bic,
//   required int accountIdentifier,
// }) async {
//   var response = await _accountsService.getAccountsLimit(
//     iban: iban,
//     bic: bic,
//     accountIdentifier: accountIdentifier,
//   );
//
//   if (response != null && response.data != null) {
//     var result = AccountLimitsMapper.fromApi(response.data).toModel();
//
//     return result;
//   } else
//     throw Exception('Account limits are not found');
// }
}
