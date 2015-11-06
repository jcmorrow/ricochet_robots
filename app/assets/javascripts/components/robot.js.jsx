var Robot = React.createClass({
  render: function(){
    var robotStyle = {
      backgroundColor: this.props.data.color
    }
    return (
      <div className="robot" style={robotStyle}></div>
    );
  }
})