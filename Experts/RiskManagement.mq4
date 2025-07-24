//+------------------------------------------------------------------+
//|                                               RiskManagement.mq4 |
//|                                  Copyright 2025, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

#include <LikeAPro/stash.mqh>
double sl_pips = 12;
double tp_pips =10;
double percent = 3.2;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit() {
//---
   pip_value = grab_pip_value();
   double lotsize = lotsize_by_percent(percent,sl_pips);
   OrderSend(Symbol(),OP_BUY,lotsize,Ask,30,Ask-(sl_pips*pip_value),Ask+(tp_pips*pip_value));
//---
   return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason) {
//---

}
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick() {
//---

}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|RETURNS LOTSIZE YOU SHOULD USE FOR sl_pips TO EQUAL x GBP/USD/EUR |
//+------------------------------------------------------------------+
double lotsize_by_currency_amount(double risk_amount, double sl_pip_distance) {
   double t_size = MarketInfo(Symbol(),MODE_TICKVALUE);
   return ((risk_amount/sl_pip_distance)/t_size)/10;
}



//+------------------------------------------------------------------+
// RETURNS THE LOTSIZE YOU SHOULD USE FOR sl_pips TO EQUAL % OF ACC. |
//+------------------------------------------------------------------+
double lotsize_by_percent(double percent_to_risk,double sl_pip_distance) {
   double account_percent = AccountBalance()/100;
   double amount_we_are_risking = account_percent * percent_to_risk;
   return lotsize_by_currency_amount(amount_we_are_risking,sl_pip_distance);
}
//+------------------------------------------------------------------+
