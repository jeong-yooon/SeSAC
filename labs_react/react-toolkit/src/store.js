// store.js
import { configureStore } from '@reduxjs/toolkit';
import calculatorReducer from './CalculatorSlice';

export const store = configureStore({
  reducer: {
    calculator: calculatorReducer,
  },
});
