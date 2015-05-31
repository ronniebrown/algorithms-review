describe 'Board', ->

  capitalize = (word) ->
    word[0].toUpperCase() + word.slice(1)

  verifyConflictTypes = (expectedConflicts, matrix) ->
    # The Board() constructor will accept a matrix and build that into a (Backbone) Board object (as defined in Board.js)
    board = new Board(matrix)
    _.map 'row col rooks majorDiagonal minorDiagonal queens'.split(' '), (conflictType) ->
      conflictDetected = board['hasAny' + capitalize(conflictType) + 'Conflicts']()
      conflictExpected = _(expectedConflicts).contains(conflictType)
      message = if conflictExpected then 'should' else 'should not'
      it message + ' find a ' + conflictType + ' conflict', ->
        expect(conflictDetected).to.be.equal conflictExpected
        return
      return
    return

  describe 'Empty board', ->
    verifyConflictTypes [ '' ], [
      [
        0
        0
        0
        0
      ]
      [
        0
        0
        0
        0
      ]
      [
        0
        0
        0
        0
      ]
      [
        0
        0
        0
        0
      ]
    ]
    return
  describe 'Board with row conflicts', ->
    verifyConflictTypes [
      'row'
      'rooks'
      'queens'
    ], [
      [
        0
        0
        0
        0
      ]
      [
        1
        1
        0
        0
      ]
      [
        0
        0
        0
        0
      ]
      [
        0
        0
        0
        0
      ]
    ]
    return
  describe 'Board with col conflicts', ->
    verifyConflictTypes [
      'col'
      'rooks'
      'queens'
    ], [
      [
        1
        0
        0
        0
      ]
      [
        0
        0
        0
        0
      ]
      [
        1
        0
        0
        0
      ]
      [
        0
        0
        0
        0
      ]
    ]
    return
  describe 'Board with major diagonal conflicts', ->
    verifyConflictTypes [
      'majorDiagonal'
      'queens'
    ], [
      [
        0
        1
        0
        0
      ]
      [
        0
        0
        1
        0
      ]
      [
        0
        0
        0
        0
      ]
      [
        0
        0
        0
        0
      ]
    ]
    return
  describe 'Board with minor diagonal conflicts', ->
    verifyConflictTypes [
      'minorDiagonal'
      'queens'
    ], [
      [
        0
        0
        1
        0
      ]
      [
        0
        0
        0
        0
      ]
      [
        1
        0
        0
        0
      ]
      [
        0
        0
        0
        0
      ]
    ]
    return
  return
