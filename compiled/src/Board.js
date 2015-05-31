// Generated by CoffeeScript 1.9.3
(function() {
  (function() {
    var makeEmptyMatrix;
    window.Board = Backbone.Model.extend({
      initialize: function(params) {
        if (_.isUndefined(params) || _.isNull(params)) {

        } else if (params.hasOwnProperty('n')) {
          this.set(makeEmptyMatrix(this.get('n')));
        } else {
          this.set('n', params.length);
        }
      },
      rows: function() {
        return _(_.range(this.get('n'))).map((function(rowIndex) {
          return this.get(rowIndex);
        }), this);
      },
      togglePiece: function(rowIndex, colIndex) {
        this.get(rowIndex)[colIndex] = +(!this.get(rowIndex)[colIndex]);
        this.trigger('change');
      },
      _getFirstRowColumnIndexForMajorDiagonalOn: function(rowIndex, colIndex) {
        return colIndex - rowIndex;
      },
      _getFirstRowColumnIndexForMinorDiagonalOn: function(rowIndex, colIndex) {
        return colIndex + rowIndex;
      },
      hasAnyRooksConflicts: function() {
        return this.hasAnyRowConflicts() || this.hasAnyColConflicts();
      },
      hasAnyQueenConflictsOn: function(rowIndex, colIndex) {
        return this.hasRowConflictAt(rowIndex) || this.hasColConflictAt(colIndex) || this.hasMajorDiagonalConflictAt(this._getFirstRowColumnIndexForMajorDiagonalOn(rowIndex, colIndex)) || this.hasMinorDiagonalConflictAt(this._getFirstRowColumnIndexForMinorDiagonalOn(rowIndex, colIndex));
      },
      hasAnyQueensConflicts: function() {
        return this.hasAnyRooksConflicts() || this.hasAnyMajorDiagonalConflicts() || this.hasAnyMinorDiagonalConflicts();
      },
      _isInBounds: function(rowIndex, colIndex) {
        return 0 <= rowIndex && rowIndex < this.get('n') && 0 <= colIndex && colIndex < this.get('n');
      },
      hasRowConflictAt: function(rowIndex) {
        var thisRow;
        thisRow = this.get(rowIndex).slice();
        thisRow.sort().reverse();
        if (thisRow[1]) {
          return true;
        } else {
          return false;
        }
      },
      hasAnyRowConflicts: function() {
        var foundConflict, i;
        foundConflict = false;
        i = 0;
        while (i < this.rows().length) {
          this.hasRowConflictAt(i) && (foundConflict = true);
          i++;
        }
        return foundConflict;
      },
      hasColConflictAt: function(colIndex) {
        var columnArray, i;
        columnArray = [];
        i = 0;
        while (i < this.rows().length) {
          columnArray.push(this.get(i)[colIndex]);
          i++;
        }
        columnArray.sort().reverse();
        if (columnArray[1]) {
          return true;
        } else {
          return false;
        }
      },
      hasAnyColConflicts: function() {
        var foundConflict, i;
        foundConflict = false;
        i = 0;
        while (i < this.rows().length) {
          this.hasColConflictAt(i) && (foundConflict = true);
          i++;
        }
        return foundConflict;
      },
      hasMajorDiagonalConflictAt: function(majorDiagonalColumnIndexAtFirstRow) {
        var oneCount, r;
        oneCount = 0;
        r = 0;
        while (r < this.rows().length) {
          !!this.get(r)[majorDiagonalColumnIndexAtFirstRow + r] && oneCount++;
          r++;
        }
        if (oneCount > 1) {
          return true;
        } else {
          return false;
        }
      },
      hasAnyMajorDiagonalConflicts: function() {
        var foundConflict, r;
        foundConflict = false;
        r = this.rows().length * -1;
        while (r < this.rows().length) {
          this.hasMajorDiagonalConflictAt(r) && (foundConflict = true);
          r++;
        }
        return foundConflict;
      },
      hasMinorDiagonalConflictAt: function(minorDiagonalColumnIndexAtFirstRow) {
        var oneCount, r;
        oneCount = 0;
        r = 0;
        while (r < this.rows().length) {
          !!this.get(r)[minorDiagonalColumnIndexAtFirstRow - r] && oneCount++;
          r++;
        }
        if (oneCount > 1) {
          return true;
        } else {
          return false;
        }
      },
      hasAnyMinorDiagonalConflicts: function() {
        var foundConflict, r;
        foundConflict = false;
        r = this.rows().length * 2;
        while (r > 0) {
          this.hasMinorDiagonalConflictAt(r) && (foundConflict = true);
          r--;
        }
        return foundConflict;
      }
    });

    /*--------------------  End of Helper Functions  --------------------- */
    makeEmptyMatrix = function(n) {
      return _(_.range(n)).map(function() {
        return _(_.range(n)).map(function() {
          return 0;
        });
      });
    };
  })();

}).call(this);

//# sourceMappingURL=Board.js.map
