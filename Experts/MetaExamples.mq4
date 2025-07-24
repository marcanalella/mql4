//+------------------------------------------------------------------+
//|                                                 MetaExamples.mq4 |
//|                                  Copyright 2025, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#include <LikeAPro/dashboard.mqh>


extern double stop_loss_pips = 20;
extern double take_profit_pips = 50;
extern double lot_size = 0.5;
extern double move_to_break_even_after_x_pips=10;


double pip_value = 0.0001;
int ticket;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit() {
//---
   init_dashboard("Logging");

   ticket = OrderSend(Symbol(),OP_BUY,lot_size,Ask,30,0,0);
   OrderSelect(ticket,SELECT_BY_TICKET);





   add_log("The ticket is "+ticket);
   add_log("Order symbol is "+OrderSymbol());
   add_log("Order Profit is "+OrderProfit());
   add_log("Order stop loss is "+OrderStopLoss());
   add_log("Order take profit is"+OrderTakeProfit());
   add_log("Order open price is "+OrderOpenPrice());

   if(OrderType()==OP_SELL) {
      double stop_loss =OrderOpenPrice()+(stop_loss_pips*pip_value);
      double take_profit=OrderOpenPrice()-(take_profit_pips*pip_value);

      OrderModify(ticket,Bid,stop_loss,take_profit,NULL);

      OrderSelect(ticket,SELECT_BY_TICKET);
      add_log("Order stop loss is "+OrderStopLoss());
      add_log("Order take profit is"+OrderTakeProfit());
   }



   if(OrderType()==OP_BUY) {
      double stop_loss =OrderOpenPrice()-(stop_loss_pips*pip_value);
      double take_profit=OrderOpenPrice()+(take_profit_pips*pip_value);

      OrderModify(ticket,Ask,stop_loss,take_profit,NULL);

      OrderSelect(ticket,SELECT_BY_TICKET);
      add_log("Order stop loss is "+OrderStopLoss());
      add_log("Order take profit is"+OrderTakeProfit());
   }
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
//--
   check();

}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void check() {
   if(ticket>0) {
      OrderSelect(ticket,SELECT_BY_TICKET);
      double pnl_pips;
      if(OrderType()==OP_BUY) {
         pnl_pips = (OrderClosePrice()-OrderOpenPrice())/pip_value;
      }

      if(OrderType()==OP_SELL) {
         pnl_pips = (OrderOpenPrice()-OrderClosePrice())/pip_value;
      }

      add_log("Pnl pips is "+pnl_pips);
      if(pnl_pips>=move_to_break_even_after_x_pips) {
         OrderModify(ticket,OrderOpenPrice(),OrderOpenPrice(),OrderTakeProfit(),NULL);
         ticket=0;

      }

   }
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double grab_pip_value() {
   double digits=MarketInfo(Symbol(),MODE_DIGITS);
   if(digits==2 || digits==3)
      return 0.01;
   else if(digits==4 || digits==5)
      return 0.0001;
   return 0.001;

}
//+------------------------------------------------------------------+
