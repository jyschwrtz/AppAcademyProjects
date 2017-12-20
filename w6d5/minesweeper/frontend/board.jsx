import React from 'react';
import * as Minesweeper from '../minesweeper.js';
import Tile from './tile';

class Board extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        {
          this.props.board.grid.map((row, rowIdx) => (
            <div key={rowIdx} className="board-row">
              {
                row.map((tile, colIdx) => (
                  <Tile
                    key={[rowIdx, colIdx]}
                    tile={tile}
                    updateGame={this.props.updateGame}
                    />
                ))
              }
            </div>
          ))
        }
      </div>
    );
  }
}

export default Board;
