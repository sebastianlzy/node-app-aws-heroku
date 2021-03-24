const index = require('./index')


test('retrieve ec2 pricing', () => {
    expect(index().length).toBe(322)
});