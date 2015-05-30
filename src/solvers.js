// hint: you'll need to do a full-search of all possible arrangements of pieces!
// (There are also optimizations that will allow you to skip a lot of the dead search space)
// take a look at solversSpec.js to see what the tests are expecting

// return a matrix (an array of arrays) representing a single nxn chessboard, with n queens placed such that none of them can attack each other
window.findNQueensSolution = function(n) {
  var board = new Board({n:n});
  var solution = undefined;
  var qCount = 0;
  var row = board[0];
  var bLast = board.length-1;
  var rLast = row.length-1;
  // start at matrix[0][0]
  // search for first available position in row 0
  function innerRecurse() {
  // base case if all queens are placed or we are at the end of the board
    if (qCount === n || row[i] === bLast && rLast) return;
    var i = 0;
    for (i; i < row.length; i++) {
      // check for conflict
      if (!hasAnyQueenConflicts(row[i])) {
        // if no conflict put a queen
        row[i] = 1;
        qQount++;
        board.row++;
        // if reach end of row
        // go back to previous row and replace 1 with 0 and recurse
      } else if (hasAnyQueenConflicts(row[i]) && row[i] === rLast) {
        board.row--;
        qCount--;
        i++;
      } else {
        row[i] = 0;
      }
    }
    innerRecurse();
  }
  solution = board;
  return solution;
};


// return the number of nxn chessboards that exist, with n queens placed such that none of them can attack each other
window.countNQueensSolutions = function(n) {
  var solutionCount = 0; 
  return solutionCount;
};
