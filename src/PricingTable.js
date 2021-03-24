import { Table, Tag, Space } from 'antd';

const columns = [
    {
        title: 'InstanceType',
        dataIndex: 'instance_type',
        key: 'instance_type',
    },
    {
        title: 'Memory',
        dataIndex: 'memory',
        key: 'memory',
        sorter: (a, b) => {
            return a.memory > b.memory ? 1 : -1
        },
        sortDirections: ['descend', 'ascend'],
    },
    {
        title: 'Vcpu',
        dataIndex: 'vcpu',
        key: 'vcpu',
        sorter: (a, b) => a.vcpu - b.vcpu,
        sortDirections: ['descend', 'ascend'],
    },
    {
        title: 'Pricing',
        key: 'pricing',
        dataIndex: 'pricing',
        render: text => {return `$${parseFloat(text).toFixed(2)}` },
        sorter: (a, b) => a.pricing - b.pricing,
        sortDirections: ['descend', 'ascend'],
    },
];

const PricingTable = ({data}) => {
    if (data.length === 0) {
        return <div>nothing</div>
    }
    return <Table columns={columns} dataSource={data} />
}

export default PricingTable