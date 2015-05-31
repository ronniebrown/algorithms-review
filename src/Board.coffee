# This file is a Backbone Model (don't worry about what that means)
# It's part of the Board Visualizer
# The only portions you need to work on are the helper functions (below)
do ->
  window.Board = Backbone.Model.extend(
    initialize: (params) ->
      if _.isUndefined(params) or _.isNull(params)
        
      else if params.hasOwnProperty('n')
        @set makeEmptyMatrix(@get('n'))
      else
        @set 'n', params.length
      return
    rows: ->
      _(_.range(@get('n'))).map ((rowIndex) ->
        @get rowIndex
      ), this
    togglePiece: (rowIndex, colIndex) ->
      @get(rowIndex)[colIndex] = + !@get(rowIndex)[colIndex]
      @trigger 'change'
      return
    _getFirstRowColumnIndexForMajorDiagonalOn: (rowIndex, colIndex) ->
      colIndex - rowIndex
    _getFirstRowColumnIndexForMinorDiagonalOn: (rowIndex, colIndex) ->
      colIndex + rowIndex
    hasAnyRooksConflicts: ->
      @hasAnyRowConflicts() or @hasAnyColConflicts()
    hasAnyQueenConflictsOn: (rowIndex, colIndex) ->
      @hasRowConflictAt(rowIndex) or @hasColConflictAt(colIndex) or @hasMajorDiagonalConflictAt(@_getFirstRowColumnIndexForMajorDiagonalOn(rowIndex, colIndex)) or @hasMinorDiagonalConflictAt(@_getFirstRowColumnIndexForMinorDiagonalOn(rowIndex, colIndex))
    hasAnyQueensConflicts: ->
      @hasAnyRooksConflicts() or @hasAnyMajorDiagonalConflicts() or @hasAnyMinorDiagonalConflicts()
    _isInBounds: (rowIndex, colIndex) ->
      0 <= rowIndex and rowIndex < @get('n') and 0 <= colIndex and colIndex < @get('n')
    hasRowConflictAt: (rowIndex) ->
      thisRow = @get(rowIndex).slice()
      thisRow.sort().reverse()
      if thisRow[1] then true else false
    hasAnyRowConflicts: ->
      foundConflict = false
      i = 0
      while i < @rows().length
        @hasRowConflictAt(i) and (foundConflict = true)
        i++
      foundConflict
    hasColConflictAt: (colIndex) ->
      columnArray = []
      i = 0
      while i < @rows().length
        columnArray.push @get(i)[colIndex]
        i++
      columnArray.sort().reverse()
      if columnArray[1] then true else false
    hasAnyColConflicts: ->
      foundConflict = false
      i = 0
      while i < @rows().length
        @hasColConflictAt(i) and (foundConflict = true)
        i++
      foundConflict
    hasMajorDiagonalConflictAt: (majorDiagonalColumnIndexAtFirstRow) ->
      oneCount = 0
      r = 0
      while r < @rows().length
        ! !@get(r)[majorDiagonalColumnIndexAtFirstRow + r] and oneCount++
        r++
      if oneCount > 1 then true else false
    hasAnyMajorDiagonalConflicts: ->
      foundConflict = false
      r = @rows().length * -1
      while r < @rows().length
        @hasMajorDiagonalConflictAt(r) and (foundConflict = true)
        r++
      foundConflict
    hasMinorDiagonalConflictAt: (minorDiagonalColumnIndexAtFirstRow) ->
      oneCount = 0
      r = 0
      while r < @rows().length
        ! !@get(r)[minorDiagonalColumnIndexAtFirstRow - r] and oneCount++
        r++
      if oneCount > 1 then true else false
    hasAnyMinorDiagonalConflicts: ->
      foundConflict = false
      r = @rows().length * 2
      while r > 0
        @hasMinorDiagonalConflictAt(r) and (foundConflict = true)
        r--
      foundConflict
  )

  ###--------------------  End of Helper Functions  ---------------------###

  makeEmptyMatrix = (n) ->
    _(_.range(n)).map ->
      _(_.range(n)).map ->
        0

  return
