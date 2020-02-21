import React from 'react';
import './App.css';
import { query } from './apollo/ApolloClient';

function App() {

  const callGraphQL = async () => {

    const queryString = `
    {
      vehicles(count: 2) {
        id
        type
        person {
          name
        }
        travels {
          id
          fromDestination
          toDestination
          vehicleId
        }
        cities {
          name
        }
        registrations {
          name
          vehicleId
          registrationId
          registration {
            id
            from
            to
            registrationYear {
              id
              year
            }
          }
        }
      }
    }
    `;

    const result = await query(queryString);
    console.log(result);
  }

  return (
    <div className="App">
      <button onClick={callGraphQL}>Call GraphQL</button>
    </div>
  );
}

export default App;
