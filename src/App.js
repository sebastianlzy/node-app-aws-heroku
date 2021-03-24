import React, {Component} from 'react';
import './App.css';
import { Layout, Menu } from 'antd';
import { Space, Input } from 'antd';
import PricingTable from './PricingTable'

const { Header, Footer, Content } = Layout;

class App extends Component {
    state = {
        prices: [],
        filteredPrices: [],
    };

    componentDidMount() {
        this.callApi()
            .then(res => this.setState({
                prices: res.prices,
                filteredPrices: res.prices
            }))
            .catch(err => console.log(err));
    }

    callApi = async () => {
        const response = await fetch('/api/ec2-pricing');
        const body = await response.json();
        if (response.status !== 200) throw Error(body.message);

        return body;
    };

    onSearch = ({target}) => {
        this.setState({
            filteredPrices: this.state.prices.filter((price) => {
                return price.instance_type.includes(target.value)
            })
        })
        console.log(target.value)
    }

    render() {
        return (
            <Layout className="layout">
                <Header>
                    <div className="logo" />
                    <Menu theme="dark" mode="horizontal" defaultSelectedKeys={['1']}>
                        <Menu.Item key="1">EC2 on-demand</Menu.Item>
                        {/*<Menu.Item key="2">EC2 Reserved instance</Menu.Item>*/}
                        {/*<Menu.Item key="3">RDS on-demand</Menu.Item>*/}
                        {/*<Menu.Item key="4">RDS Reserved instance</Menu.Item>*/}
                    </Menu>
                </Header>
                <Content style={{ padding: '0 50px' }}>
                    <div className="site-layout-content">
                        <Space style={{float: 'right', marginBottom: '10px'}}>
                            <Input placeholder="Search instance type"  onChange={this.onSearch} style={{ width: 200, padding: '10px' }} />
                        </Space>
                        <PricingTable data={this.state.filteredPrices}/>
                    </div>
                </Content>
                <Footer style={{ textAlign: 'right' }}>Made by sebastian @ 2021</Footer>
            </Layout>
        );
    }
}

export default App;