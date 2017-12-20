import React from 'react';
import Board from './board';
import * as Minesweeper from '../minesweeper.js';

class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = { board: new Minesweeper.Board(10, 10) };

    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(tile, flagging) {
    if (flagging) {
      tile.toggleFlag();
    } else {
      console.log(tile);
      tile.explore();
    }

    this.setState({
      board: this.state.board
    });
  }

  render() {
    let modal;
      if (this.state.board.lost() || this.state.board.won() ) {
        let endMessage = (this.state.board.won() ? "You Won!" : "You Lost!");
        modal =
          <div className="modal">
            <h1 className='modal-message'>{endMessage}</h1>
          </div>;
      }

    return (
      <div>
        <h1>Minesweeper</h1>
        {modal}
        <section className='game-board'>

          <Board
            board={ this.state.board }
            updateGame={ this.updateGame } />
        </section>
      </div>
    );
  }
}

export default Game;
