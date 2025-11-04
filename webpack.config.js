const webpack = require("@nativescript/webpack");
const path = require("path")

env = {
	resolve: {
		// see below for an explanation
		alias: {
			svelte: path.resolve('node_modules', 'svelte/src/runtime') // Svelte 3: path.resolve('node_modules', 'svelte')
		},
		extensions: ['.mjs', '.js', '.ts', '.tsx', '.svelte'],
		mainFields: ['svelte', 'browser', '...'],
		conditionNames: ['svelte', 'browser', '...'],
	},
	module: {
		rules: [
			// This is only needed if you use Svelte 5+ with TypeScript
			{
				test: /\.svelte\.ts$/,
				use: [ "svelte-loader", { loader: "ts-loader", options: { transpileOnly: true } }],
			},
			// This is the config for other .ts files - the regex makes sure to not process .svelte.ts files
			{
				test: /(?<!\.svelte)\.ts$/,
				loader: "ts-loader",
				options: {
					transpileOnly: true, // you should use svelte-check for type checking
				}
			},
			{
				// Svelte 5+:
				test: /\.(svelte|svelte\.js)$/,
				// Svelte 3 or 4:
				// test: /\.svelte$/,
				// In case you write Svelte in HTML (not recommended since Svelte 3):
				// test: /\.(html|svelte)$/,
				use: 'svelte-loader'
			},
			{
				// required to prevent errors from Svelte on Webpack 5+, omit on Webpack 4
				test: /node_modules\/svelte\/.*\.mjs$/,
				resolve: {
					fullySpecified: false
				}
			}
		]
	}
}

module.exports = (env) => {
	webpack.init(env);

	// Learn how to customize:
	// https://docs.nativescript.org/webpack

	return webpack.resolveConfig();
};
