import { sum, screamify } from '../practice.js';

describe('sum', () => {
  test('adds the two inputs together', () => {
    expect(sum(1, 2)).toEqual(3);
  });
});

describe('screamify', () => {
  test('capitalizes the input', () => {
    expect(screamify('cat')).toEqual('CAT');
  });
});
