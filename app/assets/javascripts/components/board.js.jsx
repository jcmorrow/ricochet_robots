var Board = React.createClass({
  render: function(){
    var spaces = [];
    console.log(this.props)
    this.props.spaces.forEach(function(space){
      spaces.push(<Space />)
    })
    return (
      {spaces}
    );
  }
})