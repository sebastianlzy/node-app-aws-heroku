
const ec2pricing = require('../aws-offers/ec2-ap-southeast-1.json')
const get = require('lodash/get')

const getProductInformation = (product) => {
    return {
        id: get(product, 'id'),
        vcpu: get(product, 'attributes.aws:ec2:vcpu'),
        memory: get(product, 'attributes.aws:ec2:memory'),
        instanceType: get(product, 'attributes.aws:ec2:instanceType'),
        pricing: get(product, 'price.USD'),
    }
}

module.exports = () => {
    const ec2pricings = get(ec2pricing, 'prices').map((product) => getProductInformation(product))
    ec2pricings.sort((price1, price2) => {
        if (price1.instanceType > price2.instanceType) return 1
        return -1
    } )
    return ec2pricings
}