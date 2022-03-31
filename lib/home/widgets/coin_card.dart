import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/home/domain/models/models.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../constants/constants.dart';

class CoinCard extends StatelessWidget {
  final DataModel coin;
  const CoinCard({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _iconCoinUrl = 'https://raw.githubusercontent.com/alexandrebouttier/coinmarketcap-icons-cryptos/main/icons/';
    final _theme = Theme.of(context);
    final _coinPerChange1h = coin.quoteModel.usdModel.percentChange1h;
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              print("text");
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.close,
            label: 'Sell',
          ),
        ],
      ),

      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (context) {
              print("text");
            },
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.add,
            label: 'Buy',
          ),
        ],
      ),
      child: Container(
        height: 90,
        color: Color.fromRGBO(55, 66, 92, 4),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Image.network(
                _iconCoinUrl + coin.symbol.toLowerCase() + '.png',
                scale: 1.5,
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${coin.name} (${coin.symbol})",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "0",
                      style: _theme.textTheme.caption?.copyWith(fontSize: 14),
                    )
                  ],
                ),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${coin.quoteModel.usdModel.price.toStringAsFixed(3)}",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text("${_coinPerChange1h.toStringAsFixed(5)}%",
                          style: TextStyle(color: _coinPerChange1h > 0 ? kSuccessColor : kDangerColor, fontSize: 16.0)),
                      Icon(
                        _coinPerChange1h > 0 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: _coinPerChange1h > 0 ? kSuccessColor : kDangerColor,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
