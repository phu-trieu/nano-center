import React, { useState } from 'react';
import Nav from './nav';
import Header from './header';
import Banner from './banner';
import ProductList from './product-list';

// export default class App extends React.Component {
//   constructor(props) {
//     super(props);
//     this.state = {
//       message: null,
//       isLoading: true
//     };
//   }

//   componentDidMount() {
//     fetch('/api/health-check')
//       .then(res => res.json())
//       .then(data => this.setState({ message: data.message || data.error }))
//       .catch(err => this.setState({ message: err.message }))
//       .finally(() => this.setState({ isLoading: false }));
//   }

//   render() {
//     return this.state.isLoading
//       ? <h1>Testing connections...</h1>
//       : <h1>{this.state.message}</h1>;
//   }
// }

const App = () => {
  const [hamburgerOpen, setHamburgerOpen] = useState(true);

  const handleClick = () => {
    setHamburgerOpen(state => !state);
  };

  return (
    <div className="overlay">
      <Nav open={hamburgerOpen} />
      <div onClick={hamburgerOpen ? handleClick : () => {}} className={hamburgerOpen ? 'shade active' : 'shade'}>
        <Header handleClick={handleClick} />
        <Banner />
        <ProductList />
      </div>
    </div>
  );
};

export default App;
