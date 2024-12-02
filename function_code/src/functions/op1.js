const { app } = require('@azure/functions');

app.http('FuncFromCli', {
    methods: ['GET', 'POST'],
    authLevel: 'anonymous',
    handler: async (request, context) => {
        context.log(`Http function processed request for url "${request.url}"`);

        const name = request.query.get('name') || await request.text() || 'world';

        // return { body: `Updated Hello, ${name}!` };
        return {
        body: `4th updated Hello, ${name}!`,
        headers: {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
            "Access-Control-Allow-Headers": "Content-Type",
            "custom-header": "bbb"
        }
    }
    }
});
