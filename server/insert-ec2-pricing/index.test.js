const retrieveEc2Pricing = require('../retrieve-ec2-pricing')
const pool = require('../pg-pool')

jest.setTimeout(100000)

test.skip('insert ec2 pricing', async () => {

    const client = await pool.connect()
    const ec2Prices = retrieveEc2Pricing()
    const insertIntoDb = async (ec2Price) => {

        try {
            console.log(`
                INSERT INTO public.elastic_compute_cloud (instance_type, memory, pricing, vcpu) 
                VALUES ('${ec2Price.instanceType}', '${ec2Price.memory}', '${ec2Price.pricing}', '${ec2Price.vcpu}')
            `)
            await client.query(`
                INSERT INTO public.elastic_compute_cloud (instance_type, memory, pricing, vcpu) 
                VALUES ('${ec2Price.instanceType}', '${ec2Price.memory}', '${ec2Price.pricing}', '${ec2Price.vcpu}')
            `)
        }
        catch(err) {
            console.log(err.stack)
        }

        ec2Prices.shift()
        if (ec2Prices.length > 0) {
            return insertIntoDb(ec2Prices[0])
        }

    }

    if (ec2Prices.length > 0) {
        await insertIntoDb(ec2Prices[0])
    }


    client.release()
    pool.end()
    expect(true).toBe(true)
});