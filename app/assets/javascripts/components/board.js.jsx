var Board = React.createClass({
  getInitialState: function() {
    return {data: [{"id":10305,"board_id":51,"created_at":"2015-11-05T20:08:57.221Z","updated_at":"2015-11-05T20:08:57.221Z","row":0,"column":0},
                   {"id":10306,"board_id":51,"created_at":"2015-11-05T20:08:57.223Z","updated_at":"2015-11-05T20:08:57.223Z","row":0,"column":1},
                   {"id":10307,"board_id":51,"created_at":"2015-11-05T20:08:57.223Z","updated_at":"2015-11-05T20:08:57.223Z","row":0,"column":2},
                   {"id":10308,"board_id":51,"created_at":"2015-11-05T20:08:57.224Z","updated_at":"2015-11-05T20:08:57.224Z","row":0,"column":3},
                   {"id":10565,"board_id":52,"created_at":"2015-11-06T01:55:04.322Z","updated_at":"2015-11-06T01:55:04.322Z","row":0,"column":4,"robot":{"id":191,"color":"red","space_id":10565,"created_at":"2015-11-06T01:55:04.564Z","updated_at":"2015-11-06T01:55:04.564Z"}}]};
  },
  render: function(){
    console.log(this.state.data)
    var spaceNodes = this.state.data.map(function(space){
      return (<Space column={space.column} row={space.row} robot={space.robot} key={space.id} />);
    });
    return (
      <div className="board">{spaceNodes}</div>
    );
  }
})

ReactDOM.render(
  <Board />,
  document.getElementById('board')
);

// space example:
// {  
//   "id":10561,
//   "board_id":52,
//   "created_at":"2015-11-06T01:55:04.318Z",
//   "updated_at":"2015-11-06T01:55:04.318Z",
//   "row":0,
//   "column":0
// }


// space (with robot) example:
// {
//   "id":10565,
//   "board_id":52,
//   "created_at":"2015-11-06T01:55:04.322Z",
//   "updated_at":"2015-11-06T01:55:04.322Z",
//   "row":0,
//   "column":4,
//   "robot":{
//     "id":191,
//     "color":"red",
//     "space_id":10565,
//     "created_at":"2015-11-06T01:55:04.564Z",
//     "updated_at":"2015-11-06T01:55:04.564Z"
//   }
// }
  