// Example 5-4: Update the test to expect the new response
//(td5/scripts/sample-app/app.test.js)
const request = require('supertest');
const app = require('./app');

describe('Test the root path', () => {
    test('It should respond with "DevOps Labs!"', async () => {
        const response = await request(app).get('/');
        expect(response.statusCode).toBe(200);
        expect(response.text).toBe('DevOps Labs!');
    });
})