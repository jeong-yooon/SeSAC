import React, {useState} from "react";
import './App.css';
import {createStore} from 'redux';
import {Provider, useSelector, useDispatch, connect} from 'react-redux';

const store = createStore();
function App() {
  const [number, setNumber] = useState(1);
  return (
    <div id="container">
      <h1>Root : {number}</h1>
      <div id="grid">
        <Provider store={store}>
          {/* <Left1 number={number}></Left1>
          <Right1
          onIncrease={() => {
            setNumber(number + 1);
          }}></Right1> */}
          <Left1></Left1>
          <Right1></Right1>
        </Provider>
      </div>
    </div>
  );
}

function Left1(props) {
  return (
    <div>
      {/* <h1>Left1 : {props.number}</h1>
      <Left2 number={props.number}></Left2> */}
      <h1>Left1</h1>
      <Left2></Left2>
    </div>
  )
}

function Left2(props) {
  return (
    <div>
      {/* <h1>Left2 : {props.number}</h1>
      <Left3 number={props.number}></Left3> */}
      <h1>Left2</h1>
      <Left3></Left3>
    </div>
  )
}

function Left3(props) {
  console.log('3');
  const number = useSelector((state) => state.number);
  return (
    <div>
      {/* <h1>Left3: {props.number}</h1> */}
      <h1>Left3 : {number}</h1>
    </div>
  )
}

function Right1(props) {
  return (
    <div>
      {/* <h1>Right1</h1>
      <Right2
      onIncrease={() => {
        props.inIncrease();
      }}></Right2> */}
      <h1>Right1</h1>
      <Right2></Right2>
    </div>
  )
}

function Right2(props) {
  return (
    <div>
      <h1>Right2</h1>
      {/* <Right3
      onIncrease={() => {
        props.onIncrease();
        }}></Right3> */}
        <Right3></Right3>
    </div>
  )
}

function Right3(props) {
  const dispatch = useDispatch();
  return (
    <div>
      <h1>Right3</h1>
      {/* <input type="button" value="+" onClick={() =>{
        props.onIncrease();
      }}></input> */}
      <input type="button" value="+" onClick={() => {
        dispatch({ type: 'PLUS' });
      }}></input>
    </div>
  )
}

export default App;
