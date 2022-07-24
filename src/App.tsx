import React, { useCallback, useEffect } from 'react';
import logo from './logo.svg';
import './App.css';
import { CovidChart } from './components/CovidChart';
import _messages from './data/RegierungBW-CoronaBerichte.json';

function App() {

  useEffect(() => {
    console.log("Messages: ", _messages);

    _messages.slice(0, 5).forEach(element => {
      // console.log("Element: ", element.message);
      const splitmessage = element.message.split("<br />");
      // console.log("First line: ", splitmessage[0]);
      //const datePattern = new RegExp("\d");
      const datePattern = new RegExp("(?<date>\\d{1,2}\\. \\w{3,9} \\d{4})");
      const incidencePattern = new RegExp("[LS]K (?<city>[\\w-]+) \\((?<incidence>[\\d\\.,]+)\\)");
      const dateExec = datePattern.exec(splitmessage[0]);
      if (dateExec !== null) {
        const date = dateExec[1];
        splitmessage.forEach(line => {
          const retval = incidencePattern.exec(line);
          // console.log(retval);
          if (retval !== null) {
            const city = retval[1];
            const incidence = retval[2];
            console.log("Date: '" + date + "', City: '" + city + "', Incidence: '" + incidence + "'");
          }
        });
      }
    });
  });

  return (
    <div className="App">
      <CovidChart />

    </div>
  );
}

export default App;
