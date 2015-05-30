// depth first search / backtracking solution
window.countNQueensSolutions = function(n){
  var board = new Board({n:n});
  var solutionCount = 0; 

  if ( n === 0 ) return 1;

  function innerRecurse(row) {

    for( var i = 0; i < n; i++ ) {
      board.rows()[row][i] = 1;

      if( !board.hasAnyQueensConflicts() ) {
        if ( row === (n-1) ){
          solutionCount++;
          board.rows()[row][i] = 0;
        } else {
          innerRecurse(row+1);
          board.rows()[row][i] = 0;
        }
      } else {
        board.rows()[row][i] = 0;
      }   
    }
  }; 

  innerRecurse(0);

  console.log('Number of solutions for ' + n + ' queens:', solutionCount);
  return solutionCount;
};