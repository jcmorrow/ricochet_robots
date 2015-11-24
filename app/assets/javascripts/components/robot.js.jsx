var Robot = React.createClass({
  render: function(){
    var colors = {
      red: '#FF3333',
      green: '#33FF33',
      blue: '#3333FF',
      yellow: '#FFFF33'
    }
    var robotStyle = {
      backgroundColor: colors[this.props.data.color]
    }
    return (
      <div className="robot" style={robotStyle}></div>
    );
  }
})