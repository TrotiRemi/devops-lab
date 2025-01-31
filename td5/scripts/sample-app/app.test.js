// app.test.js
const request = require('supertest');
const app = require('./app');
describe('Test the root path', () => {
    test('It should respond to the GET method', async () => {
        const response = await request(app).get('/');
        expect(response.statusCode).toBe(200);
        expect(response.text).toBe('Hello, World!');
    });
});

describe('Test the /name/:name path', () => {
    test('It should respond with a personalized greeting', async () => {
        const name = 'Alice';
        const response = await request(app).get(`/name/${name}`);
        expect(response.statusCode).toBe(200);
        expect(response.text).toBe(`Hello, ${name}!`);
    });
});

describe('Test the /add/:a/:b path', () => {
    test('It should return the sum of two numbers', async () => {
        const a = 5;
        const b = 3;
        const response = await request(app).get(`/add/${a}/${b}`);
        expect(response.statusCode).toBe(200);
        expect(response.text).toBe(`The sum of ${a} and ${b} is 8`);
    });

    test('It should return a 400 error for invalid inputs', async () => {
        const response = await request(app).get(`/add/foo/bar`);
        expect(response.statusCode).toBe(400);
        expect(response.text).toBe('Invalid input. Both parameters must be numbers.');
    });

    test('It should return a 400 error if one parameter is invalid', async () => {
        const response = await request(app).get(`/add/5/bar`);
        expect(response.statusCode).toBe(400);
        expect(response.text).toBe('Invalid input. Both parameters must be numbers.');
    });

    test('It should handle floating point numbers', async () => {
        const response = await request(app).get(`/add/2.5/3.5`);
        expect(response.statusCode).toBe(200);
        expect(response.text).toBe('The sum of 2.5 and 3.5 is 6');
    });
});
expect(response.text).toBe('DevOps Labs!');
