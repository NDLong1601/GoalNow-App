import 'package:flutter/material.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/model/transfer/transfer.dart';
import 'package:goalnow_app/repository/transfer_repository.dart';

class TransferProvider extends ChangeNotifier {
  final TransferRepository _repository;

  TransferProvider(this._repository);

  bool _loading = false;
  String? _error;
  List<TransferModel> _transfers = [];

  String _keyword = '';
  TransferSort _sort = TransferSort.none;

  bool get loading => _loading;
  String? get error => _error;
  TransferSort get sort => _sort;

  /// Raw data (nếu cần)
  List<TransferModel> get transfers => _transfers;

  /// UI PHẢI DÙNG CÁI NÀY
  List<TransferModel> get processedTransfers {
    List<TransferModel> list = List.from(_transfers);

    // Filter
    if (_keyword.trim().isNotEmpty) {
      final q = _keyword.trim().toLowerCase();
      list = list.where((t) => t.name.toLowerCase().contains(q)).toList();
    }

    // Sort
    switch (_sort) {
      case TransferSort.valueAsc:
        list.sort((a, b) => a.marketValue.compareTo(b.marketValue));
        break;
      case TransferSort.valueDesc:
        list.sort((a, b) => b.marketValue.compareTo(a.marketValue));
        break;
      case TransferSort.none:
        break;
    }

    return list;
  }

  /// Fetch (online / offline)
  Future<void> fetchTransfers() async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      _transfers = await _repository.getAllTransfers();
      debugPrint('Fetched ${_transfers.length} transfers');
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  /// Search
  void setKeyword(String value) {
    if (_keyword == value) return;
    _keyword = value;
    notifyListeners();
  }

  /// Sort
  void setSort(TransferSort value) {
    if (_sort == value) return;
    _sort = value;
    notifyListeners();
  }

  void clear() {
    _transfers = [];
    _keyword = '';
    _sort = TransferSort.none;
    _error = null;
    notifyListeners();
  }
}
