import React from 'react';

class AutoComplete extends React.Component{
  constructor(props) {
    super(props);
    this.state = { inputVal: "" };
  }

  updateInputVal() {
    return (e) => {
      e.preventDefault();
      // console.log(e.target.value);
      let input = e.target.value;
      this.setState({ inputVal: input });
    };

  }

  render() {
    let names = this.props.names.sort();
    let exp = this.state.inputVal + ".*";
    let re = new RegExp(exp, 'i');
    let selectedNames = names.filter((name) =>{
      return re.test(name);
    });
    return(
      <section className="AC-widget">
        <h1>Auto Complete</h1>
          <div className="AC-box">
            <input
              type="text"
              onChange={ this.updateInputVal() }
              className="AC-input"
              placeholder="search...">
            </input>
            <ul className="AC-names">
              {
                selectedNames.map((name) => (
                  <li key={name} className="name">{name}</li>
                ))
              }
            </ul>
          </div>
      </section>
    );
  }
}

export default AutoComplete;
