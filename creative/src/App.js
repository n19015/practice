import React from 'react';
import Button from '@material-ui/core/Button';

class App extends React.Component{
    constructor(props) {
        super(props)
        this.state = {
            count: 0
        }
        this.onClick = this.onClick.bind(this)
    }
    onClick() {
        this.setState((up, props) => {
            return { count: ++up.count }
        })
    }
    render () {
        return (
            <div className="App">
            <header className="App-header">
                <Button variant="contained" onClick={this.onClick}>
                    {this.state.count}
                </Button>
            </header>
            </div>
        );
    }
}
export default App;
