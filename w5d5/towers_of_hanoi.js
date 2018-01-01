const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor() {
    this.stacks = [[3, 2, 1],[],[]];
  }

  run() {
    //until tower 1 is empty and one other tower is empty
      //get move from player
      //make the move
  }

  promptMove(cb) {
    console.log(this.stacks);
    let startTowerIdx = 0;
    let endTowerIdx = 0;
    reader.question("Where would you like to mve from?", function (first_res){
      startTowerIdx = parseInt(first_res, 10);
      reader.question("Where would you like to move to?", function(second_res){
        endTowerIdx = parseInt(second_res, 10);
        reader.close();
        cb(startTowerIdx, endTowerIdx);
      });
    });
  }

  isValidMove(startTowerIdx, endTowerIdx) {
    const startTower = this.stacks[startTowerIdx];
    const endTower = this.stacks[endTowerIdx];
    console.log(startTower);
    console.log(endTower);
    if (startTower.length === 0) {
      return false;
    } else if (endTower.length === 0 ) {
      return true;
    } else if (startTower[startTower.length - 1] < endTower[endTower.length - 1]) {
      return true;
    } else {
      return false;
    }
  }
}

let testGame = new Game();
// testGame.promptMove((startTowerIdx, endTowerIdx) => console.log(startTowerIdx + " " + endTowerIdx));
console.log(testGame.isValidMove(0,1));
console.log(testGame.isValidMove(1,0));
reader.close();
