import { createSlice } from '@reduxjs/toolkit';

export const calculatorSlice = createSlice({
  name: 'calculator',
  initialState: {
    value: 0,
  },
  reducers: {
    add: (state, action) => {
      state.value = action.payload.value1 + action.payload.value2;
    },
    subtract: (state, action) => {
      state.value = action.payload.value1 - action.payload.value2;
    },
    multiply: (state, action) => {
      state.value = action.payload.value1 * action.payload.value2;
    },
    divide: (state, action) => {
      state.value = action.payload.value1 / action.payload.value2;
    },
    reset: (state) => {
      state.value = 0;
    },
  },
});

export const { add, subtract, multiply, divide, reset } = calculatorSlice.actions;
export const selectValue = (state) => state.calculator.value;

export default calculatorSlice.reducer;
