var Space = React.createClass({
  getInitialState: function(){
    if(this.props.robot != null)
    {
      var robot = <Robot data={this.props.robot} />
    }
    else
    {
      var robot = '';
    }
    return({
      robot: robot
    })
  },
  render: function(){
    return (
      <div className="space">{this.state.robot}</div>
    );
  }
})