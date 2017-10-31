import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Space from './space'

const Board = props => (
  <div className="board">
    {props.spaces.map(space => <Space />)}
  </div>
)

function defaultSpaces() {
  var spaces = [];
  for(var i = 0; i < 256; i++) { 
    spaces.push({});
  }
  return spaces;
}

Board.defaultProps = {
  spaces: defaultSpaces()
}

Board.propTypes = {
  spaces: PropTypes.array
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Board name="React" />,
    document.body.appendChild(document.createElement('div')),
  )
})
