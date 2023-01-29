const HtmlWebPackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CopyPlugin = require("copy-webpack-plugin");
const path = require('path');
const filesHTML = [
    {
        filename: 'index.html',
        chunks: ['index']
    },
    {   
        filename: './html/interfazHumano.html',
        chunks: ['interfazHumano']
    },
    {   
        filename: './html/interfazDios.html',
        chunks: ['interfazDios']
    },
    {
        filename: './html/crearPruebas.html',
        chunks: ['crearPruebas']
    },
    {
        filename: './html/asignarPruebas.html',
        chunks: ['asignarPruebas']
    },
    {
        filename: './html/perfilHumano.html',
        chunks: ['perfilHumano']
    },
    {
        filename: './html/perfilDios.html',
        chunks: ['perfilDios']
    },
    {
        filename: './html/crearHumanos.html',
        chunks: ['crearHumanos']
    },
    {
        filename: './html/hermes.html',
        chunks: ['hermes']
    },
    {
        filename: './html/faqsDios.html',
        chunks: ['faqs']
    },
    {
        filename: './html/faqsHumano.html',
        chunks: ['faqs']
    },
    {
        filename: './html/pasarPruebas.html',
        chunks: ['pasarPruebas']
    },
    {
        filename: './html/quienesSomosDioses.html',
        chunks: ['quienesSomos']
    },
    {
        filename: './html/quienesSomosHumanos.html',
        chunks: ['quienesSomos']
    }
]

module.exports = {
    mode: 'development',
    devServer: {
        historyApiFallback: true,
        allowedHosts: 'all',
        static: {
            directory: path.join(__dirname, '/')
        },
        hot: true,
        open:true
    },
    output: {
        clean: true
    },
    module: {
        rules: [
            {
                test: /\.html$/,
                loader: 'html-loader',
                options: {
                    sources: false
                }
            },       
            {
                test: /\.(c|sc|sa)ss$/,
                use: [ MiniCssExtractPlugin.loader, 
                    'css-loader',
                    'sass-loader',
                    {
                        loader: 'postcss-loader',
                        options: {
                            postcssOptions: {
                                plugins: () => {
                                    require('autoprefixer')
                                }
                            }
                        }
                    }
                ]
            },
            {
                test: /\.(png|jpe?g|gif)$/,
                loader: 'file-loader'
            }
        ]
    },
    entry: {
        index: './src/index.js',
        interfazHumano: './src/js/initInterfaces/interfazHumano.js',
        interfazDios: './src/js/initInterfaces/interfazDios.js',
        crearPruebas: './src/js/initInterfaces/crearPruebas.js',
        asignarPruebas: './src/js/initInterfaces/asignarPruebas.js',
        perfilHumano: './src/js/initInterfaces/perfilHumano.js',
        perfilDios: './src/js/initInterfaces/perfilDios.js',
        crearHumanos: './src/js/initInterfaces/crearHumanos.js',
        hermes: './src/js/initInterfaces/hermes.js',
        faqs: './src/js/initInterfaces/faqs.js',
        pasarPruebas: './src/js/initInterfaces/pasarPruebas.js',
        quienesSomos: './src/js/initInterfaces/quienesSomos.js'
    },
    optimization: {},
    plugins: [
        new MiniCssExtractPlugin({
            filename: '[name].css',
            ignoreOrder: false
        }),
        new CopyPlugin({
            patterns: [
                {from: 'src/assets/', to: 'assets/'},
                {from: 'src/html/*', to: 'html/[name].[ext]'}
            ]
        })
    ].concat(filesHTML.map((templateFile) => new HtmlWebPackPlugin({
        filename: templateFile.filename,
        template: './src/'+templateFile.filename,
        chunks: templateFile.chunks,
        inject: (templateFile.chunks.length==0) ? false: true
    })))
};