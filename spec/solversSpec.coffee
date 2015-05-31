expect = chai.expect

describe 'solvers', ->

  window.displayBoard = ->

  describe 'countNQueensSolutions()', ->
    it 'finds the number of valid solutions for n of 0-8', ->
      _.range(0, 19).map (n) ->
        solutionCount = countNQueensSolutions(n)
        expectedSolutionCount = [
          1
          1
          0
          0
          2
          10
          4
          40
          92
          352
          724
          2680
          14200
          73712
          365596
          2279184
          14772512
          95815104
          666090624
        ][n]
        expect(solutionCount).to.be.equal expectedSolutionCount
        return
      return
    return
  return
