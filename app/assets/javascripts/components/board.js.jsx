var Board = React.createClass({
  render: function(){
    console.log(this.props)
    var spaceNodes = this.props.data.map(function(space){
      return (<Space />);
    });
    return (
      <div className="board">{spaceNodes}</div>
    );
  }
})