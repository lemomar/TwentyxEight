// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_value.g.dart';

const List<CurrencyValue> defaultCurrencyValueList = [];

@JsonSerializable()
class CurrencyValue extends Equatable {
  const CurrencyValue({this.symbol = '', required this.value, required this.timestamp});

  factory CurrencyValue.fromJson(Map<String, dynamic> json) => _$CurrencyValueFromJson(json);

  static const CurrencyValue empty = CurrencyValue(value: 0, timestamp: 0);

  final String symbol;
  @JsonKey(name: 'price')
  final double value;
  @JsonKey(name: 'time')
  final double timestamp;

  @override
  String toString() => 'CurrencyValue(symbol: $symbol, value: $value, timestamp: $timestamp)';

  @override
  List<Object?> get props => [symbol, value, timestamp];
}

const template = [
  'Cette liste devrait suffire: Bitcoin (BTC)',
  'Bitcoin Cash (BCH)',
  'Doge (DOGE)',
  'Ethereum (ETH)',
  'Litecoin (LTC)',
  'Ripple (XRP)',
  'Stellar (XLM)',
  'EOS (EOS)',
  'OMG Network (OMG)',
  '0x (ZRX)',
  'Tezos (XTZ)',
  'Bancor (BNT)',
  'Cardano (ADA)',
  'Filecoin (FIL)',
  'Loopring (LRC)',
  'Numerai (Numerai)',
  'Orchid (OXT)',
  'Synthetix (SNX)',
  'The Graph (GRT)',
  'Universal Market Access (UMA) and Uniswap (UNI)',
  'Yearn Finance (YFI)',
  'Cosmos (ATOM)',
  'New Kind of Network(NKN)',
  'Matic(Matic)',
  'Algorand (Algo)',
  'Celo (Celo)',
  'Band (Band)',
  'Chainlink (Link)',
  'Tellor (TRB)',
  'Aave (AAVE)',
  'Compound (COMP)',
  'Curve Finance(CRV)',
  'Sushi (SUSHI)',
  '1inch (1inch)',
  'Mirror (MIR)',
  'Origin Protocol (OGN)',
  'Basic Attention Token (BAT)',
  'Enjin (ENJ)',
  'SKALE Network (SKL)',
  'Cartesi (CTSI)',
  'Storj (STORJ)',
  'iExec (RLC)',
  'Polkadot (DOT)',
  'Solana (SOL)',
  'Internet Computer (ICP)',
  'Kyber (KNC)',
  'Keep Network (KEEP)',
  'Decentraland (MANA)',
  'Anker (ANKR)',
  'NU (NuCypher)',
  'Amp (AMP)',
  'Chiliz (CHZ)',
  'Balancer (BAL)',
  'Maker (MKR)',
  'Mask Network (MASK)',
  'Fetch.ai (FET)',
  'Alchemy Pay (ACH)',
  'Quant (QNT). Sandbox (SAND)',
  'Gala (GALA)',
  'Axie Infinity (AXS)',
  'JasmyCoin (JASMY)',
  'Ethereum Name Service (ENS)',
  'Dash (DASH)',
  'Flow (FLOW)',
  'Immutable X (IMX)',
  'Cronos (CRO)',
  'IDEX (IDEX)',
  'Ren (REN)',
  'Spell Token (SPELL)',
  'Perpetual Protocol (PERP)',
  'Biconomy (BICO)',
  'COTI (COTI) and Enzyme (MLN)'
];
