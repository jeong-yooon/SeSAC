// Calculator.js
import React, { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { add, subtract, multiply, divide, reset, selectValue } from './calculatorSlice';

const Calculator = () => {
  const dispatch = useDispatch();
  const value = useSelector(selectValue);
  const [input1, setInput1] = useState('');
  const [input2, setInput2] = useState('');

  const handleInput1Change = (e) => {
    setInput1(e.target.value);
  };

  const handleInput2Change = (e) => {
    setInput2(e.target.value);
  };

  const handleAdd = () => {
    dispatch(add({ value1: parseInt(input1, 10), value2: parseInt(input2, 10) }));
  };

  const handleSubtract = () => {
    dispatch(subtract({ value1: parseInt(input1, 10), value2: parseInt(input2, 10) }));
  };

  const handleMultiply = () => {
    dispatch(multiply({ value1: parseInt(input1, 10), value2: parseInt(input2, 10) }));
  };

  const handleDivide = () => {
    dispatch(divide({ value1: parseInt(input1, 10), value2: parseInt(input2, 10) }));
  };

  const handleReset = () => {
    dispatch(reset());
    setInput1('');
    setInput2('');
  };

  return (
    <div>
      <h1>Redux Toolkit Calculator</h1>
      <p>Result: {parseInt(value, 10)}</p>
      <input type="text" placeholder="Enter value 1" value={input1} onChange={handleInput1Change} />
      <input type="text" placeholder="Enter value 2" value={input2} onChange={handleInput2Change} />
      <br />
      <button onClick={handleAdd}>Add</button>
      <button onClick={handleSubtract}>Subtract</button>
      <button onClick={handleMultiply}>Multiply</button>
      <button onClick={handleDivide}>Divide</button>
      <br />
      <button onClick={handleReset}>Reset</button>
    </div>
  );
};

export default Calculator;
