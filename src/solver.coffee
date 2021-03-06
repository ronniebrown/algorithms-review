# depth first search / backtracking solution

window.xcountNQueensSolutions = (n) ->
  board = new Board(n: n)
  count = 0

  innerRecurse = (row) ->
    i = 0
    while i < n
      board.rows()[row][i] = 1
      if !board.hasAnyQueensConflicts()
        if row == n - 1
          count += 1
          board.rows()[row][i] = 0
        else
          innerRecurse row + 1
          board.rows()[row][i] = 0
      else
        board.rows()[row][i] = 0
      i++
    return

  if n == 0
    return 1
  innerRecurse 0
  console.log 'Number of solutions for ' + n + ' queens:', count
  count

# this solution requires O(N^2) while implemented over our given input type which is an adjacency matrix.

window.countNQueensSolutions = (n) ->
  count = 0
  all = 2 ** n - 1

  innerRecurse = (l, c, r) ->
    # base case
    if c == all
      count++
      return
    poss = ~(l | c | r) & all
    while poss
      bit = poss & -poss
      poss -= bit
      innerRecurse (l | bit) >> 1, c | bit, (r | bit) << 1
    return

  innerRecurse 0, 0, 0
  console.log 'Number of solutions for ' + n + ' queens:', count
  count
