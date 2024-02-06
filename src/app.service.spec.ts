import { AppService } from './app.service';

describe('AppService', () => {
    let appService: AppService;

    beforeEach(() => {
        appService = new AppService();
    });

    it('should return actual text instead of N/A', () => {
        // Mock process.env.SALUTATION_TEXT with an actual text
        process.env.SALUTATION_TEXT = 'Hello World';

        const result = appService.getHello();
        console.log({result})
        expect(result).not.toBe('N/A');
        expect(result).toEqual('Hello World');
    });

    it('should return actual text instead of undefined', () => {
        // Ensure process.env.SALUTATION_TEXT is not undefined by setting it
        process.env.SALUTATION_TEXT = 'Hello Again';

        const result = appService.getHello();
        expect(result).toBeDefined();
        expect(result).toEqual('Hello Again');
    });

    // Cleanup if necessary
    afterEach(() => {
        delete process.env.SALUTATION_TEXT;
    });
});
