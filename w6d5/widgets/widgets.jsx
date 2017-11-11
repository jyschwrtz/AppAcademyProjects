import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';
import Weather from './frontend/weather';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(
    <div className= "widgets">
      <Clock />
      <Weather />
      <Tabs
        titles={['one', 'two', 'three']}
        contents={['I am the first', 'second pane here', 'third pane here']} />
    </div>
    , root);
});
