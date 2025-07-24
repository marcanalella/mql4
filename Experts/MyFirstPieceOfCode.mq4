//+------------------------------------------------------------------+
//|                                       my_first_piece_of_code.mq4 |
//|                                  Copyright 2025, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
extern double volume = 1.21;
extern string asset_to_trade = "EURUSD";
extern string trade_comment = "Making progress";;;;;;;;;
extern double pip_value = 0.0001;
extern double tp_pips = 35;
extern double sl_pips = 10;
extern string message = "Hey bro! Trade ticket is ";

int ticket;
string name = "coder";

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit() {
//---

   our_first_function();

   return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason) {
//---

// OrderClose(ticket,
}
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick() {
//---
//  OrderSend("EURUSD",OP_BUY,0.01,Ask,30,0,0,"my first trade");
}
//+------------------------------------------------------------------+
void our_first_function() {
   double current_price = (Ask+Bid)/2;
   RefreshRates();
   OrderSend(asset_to_trade,OP_BUY,volume,Ask,30,current_price-(sl_pips*pip_value),current_price+(tp_pips*pip_value),trade_comment);
   tp_pips = tp_pips + 10;
   RefreshRates();
   OrderSend(asset_to_trade,OP_BUY,volume,Ask,30,current_price-(sl_pips*pip_value),current_price+(tp_pips*pip_value),trade_comment);
   tp_pips = tp_pips + 10;
   RefreshRates();
   OrderSend(asset_to_trade,OP_BUY,volume,Ask,30,current_price-(sl_pips*pip_value),current_price+(tp_pips*pip_value),trade_comment);
   tp_pips = tp_pips + 10;
   RefreshRates();
   OrderSend(asset_to_trade,OP_BUY,volume,Ask,30,current_price-(sl_pips*pip_value),current_price+(tp_pips*pip_value),trade_comment);
   tp_pips = tp_pips + 10;
   RefreshRates();
   OrderSend(asset_to_trade,OP_BUY,volume,Ask,30,current_price-(sl_pips*pip_value),current_price+(tp_pips*pip_value),trade_comment);
   tp_pips = tp_pips + 10;
   RefreshRates();
   OrderSend(asset_to_trade,OP_BUY,volume,Ask,30,current_price-(sl_pips*pip_value),current_price+(tp_pips*pip_value),trade_comment);
   tp_pips = tp_pips + 10;
   RefreshRates();
   OrderSend(asset_to_trade,OP_BUY,volume,Ask,30,current_price-(sl_pips*pip_value),current_price+(tp_pips*pip_value),trade_comment);
   tp_pips = tp_pips + 10;
   RefreshRates();
   OrderSend(asset_to_trade,OP_BUY,volume,Ask,30,current_price-(sl_pips*pip_value),current_price+(tp_pips*pip_value),trade_comment);
   tp_pips = tp_pips + 10;
   RefreshRates();
   OrderSend(asset_to_trade,OP_BUY,volume,Ask,30,current_price-(sl_pips*pip_value),current_price+(tp_pips*pip_value),trade_comment);
   tp_pips = tp_pips + 10;
   RefreshRates();
   OrderSend(asset_to_trade,OP_BUY,volume,Ask,30,current_price-(sl_pips*pip_value),current_price+(tp_pips*pip_value),trade_comment);






}
//+------------------------------------------------------------------+
