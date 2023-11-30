// CalculatorSlice.js
import { createSlice } from '@reduxjs/toolkit';

export const calculatorSlice = createSlice({
  name: 'calculator',
  initialState: {
    value1: '',
    value2: '',
    operator: '',
    result: null,
  },
  reducers: {
    updateValue: (state, action) => {
      const { name, value } = action.payload;
      state[name] = value;
    },
    calculate: (state) => {
      const num1 = parseInt(state.value1, 10);
      const num2 = parseInt(state.value2, 10);

      switch (state.operator) {
        case '+':
          state.result = num1 + num2;
          break;
        case '-':
          state.result = num1 - num2;
          break;
        case '*':
          state.result = num1 * num2;
          break;
        case '/':
          state.result = num1 / num2;
          break;
        default:
          break;
      }
    },
    clearValues: (state) => {
      state.value1 = '';
      state.value2 = '';
      state.operator = '';
      state.result = null;
    },
  },
});

export const { updateValue, calculate, clearValues } = calculatorSlice.actions;

export const selectCalculator = (state) => state.calculator;

export default calculatorSlice.reducer;
