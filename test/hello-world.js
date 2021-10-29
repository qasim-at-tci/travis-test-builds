import helloWorld from '../index.js'
import assert from 'assert'
describe('helloWorld', () => {
    describe('#init()', () => {
        it('should return hello world', () => {
            assert.equal(helloWorld.init(), 'hello world')
        })
    })
})