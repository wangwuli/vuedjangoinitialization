module.exports = {
  devServer: {
    open: true, // 是否自动弹出浏览器页面
    host: '0.0.0.0',
    port: '8080',
    https: false,
    hotOnly: false,
    proxy: {
      '/background/': {
        target: 'http://localhost:8000', // API服务器的地址
        ws: true, // 代理websockets
        changeOrigin: true // 虚拟的站点需要更管origin
        // pathRewrite: { // 重写路径 比如'/api/aaa/ccc'重写为'/aaa/ccc'
        //   '^/home/': ''
        // }
      }
    }
  }
}// lintOnSave: false // 取消 eslint 验证