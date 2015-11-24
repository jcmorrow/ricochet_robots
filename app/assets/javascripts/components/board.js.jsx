var Board = React.createClass({
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
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
  