#ifndef  ENERGY_BUDGETIZER_H
#define  ENERGY_BUDGETIZER_H

enum {
  FORECAST_NUM_SLOTS      = 36,   // number of time slots for forecasting (effective horizon)
  HARVESTMODEL_NUM_SLOTS  = 12,   // number of time slots
  HARVESTMODEL_BASE_INTVL = 300,  // base interval length in seconds
  HARVESTMODEL_CYCLE_LEN  = 288,  // number of base intervals per cycle (e.g., day)
  HARVESTMODEL_FILTER     = 104   // filter coeff (EWMA) in 1/128
};


#endif /* ENERGY_BUDGETIZER_H */
