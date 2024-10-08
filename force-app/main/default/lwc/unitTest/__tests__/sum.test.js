import { sum } from 'force-app/main/default/lwc/unitTest/__tests__/sum';
    
describe('sum()', () => {
  it('should add 1 and 2 returning 3', () => {
    expect(sum(1, 2)).toBe(3);
  });
});