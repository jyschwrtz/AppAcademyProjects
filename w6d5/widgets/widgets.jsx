import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';
import Weather from './frontend/weather';
import AutoComplete from './frontend/autocomplete';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(
    <div className= "widgets">
      <Clock />
      <Weather />
      <div className="small-widgets">
        <Tabs
          titles={['one', 'two', 'three']}
          contents={['I am the first', 'second pane here', 'third pane here']}
        />
        <AutoComplete
          names={['Abba', 'Barney', 'Barbara', 'Emily', 'Jay', 'Joel', 'Jared', 'Josh', 'Stacy', 'Joe', 'Janel', 'Jess']}
        />
      </div>
    </div>
    , root);
});
