import React from 'react';
// import * as Minesweeper from '../minesweeper.js';

class Tile extends React.Component {
  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    e.preventDefault;
    this.props.updateGame(this.props.tile, e.altKey);
  }

  render() {
    let tile = this.props.tile;
    let text, status, count;
    if (tile.explored && tile.bombed) {
      status = 'bombed';
      text = '\u2622';
    } else if (tile.explored) {
      status = 'explored';
      count = tile.adjacentBombCount();
      text = count ? count : " ";
    } else if (tile.flagged) {
      status = 'flagged';
      text = '\u2691';
    } else {
      text = " ";
    }

    let className = `tile ${status}`;
    return (
      <div
        className={className}
        onClick={ this.handleClick }
        >
        <h1>{text}</h1>
      </div>
    );
  }
}

export default Tile;
