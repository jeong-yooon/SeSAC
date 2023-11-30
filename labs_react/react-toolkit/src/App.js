// App.js
import React from 'react';
import { useDispatch, useSelector } from 'react-redux';
import {
  selectCalculator,
  updateValue,
  calculate,
  clearValues,
} from './CalculatorSlice';

function App() {
  const dispatch = useDispatch();
  const calculator = useSelector(selectCalculator);

  const handleChange = (e) => {
    const { name, value } = e.target;
    dispatch(updateValue({ name, value }));
  };

  const handleOperatorChange = (operator) => {
    dispatch(updateValue({ name: 'operator', value: operator }));
  };

  const handleCalculate = () => {
    dispatch(calculate());
  };

  const handleClear = () => {
    dispatch(clearValues());
  };

  return (
    <div>
      <input
        type="number"
        name="value1"
        value={calculator.value1}
        onChange={handleChange}
        placeholder="Enter number 1"
      />
      <select onChange={(e) => handleOperatorChange(e.target.value)}>
        <option value="">Select Operator</option>
        <option value="+">+</option>
        <option value="-">-</option>
        <option value="*">*</option>
        <option value="/">/</option>
      </select>
      <input
        type="number"
        name="value2"
        value={calculator.value2}
        onChange={handleChange}
        placeholder="Enter number 2"
      />
      <button onClick={handleCalculate}>=</button>
      <button onClick={handleClear}>Clear</button>
      {calculator.result !== null && <div>Result: {calculator.result}</div>}
    </div>
  );
}

export default App;
