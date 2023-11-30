import logo from './logo.svg';
import './App.css';
import Calculator from './Calculator';
import { Provider } from 'react-redux';
import { store } from './store';
import react from 'react';

function App() {
  return (
    <div className="App">
      <Provider store={store}>
        <Calculator />
      </Provider>
    </div>
  );
}

export default App;
