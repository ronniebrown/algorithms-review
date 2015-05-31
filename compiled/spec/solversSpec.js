// Generated by CoffeeScript 1.9.3
(function() {
  var expect;

  expect = chai.expect;

  describe('solvers', function() {
    window.displayBoard = function() {};
    describe('countNQueensSolutions()', function() {
      it('finds the number of valid solutions for n of 0-8', function() {
        _.range(0, 19).map(function(n) {
          var expectedSolutionCount, solutionCount;
          solutionCount = countNQueensSolutions(n);
          expectedSolutionCount = [1, 1, 0, 0, 2, 10, 4, 40, 92, 352, 724, 2680, 14200, 73712, 365596, 2279184, 14772512, 95815104, 666090624][n];
          expect(solutionCount).to.be.equal(expectedSolutionCount);
        });
      });
    });
  });

}).call(this);

//# sourceMappingURL=solversSpec.js.map