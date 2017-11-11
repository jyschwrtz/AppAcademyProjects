import React from 'react';
import Header from './header';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedTabIndex: 0
    };
    this.titles = props.titles;
    this.content = props.content;
  }

  selectTab(idx) {
    return (e) => {
      e.preventDefault();
      this.setState({ selectedTabIndex: idx });
    };
  }

  render() {
    const {titles, contents} = this.props;
    return (
      <section className="tab-widget-title">
        <h1>Tabs</h1>
        <div className="tab-widget">
          <ul className="tab-titles">
            {
            titles.map((title, idx) => (
              <h1
                key={title + "h"}
                onClick={ this.selectTab(idx) }
                className={ this.state.selectedTabIndex === idx ? "tab tab-selected" : "tab"}
                name={idx}
                title={title}>{title}</h1>
            ))
            }
          </ul>
          <article className="tab-content">
            <p>{contents[this.state.selectedTabIndex]}</p>
          </article>
        </div>
    </section>
    );
  }
}

export default Tabs;
