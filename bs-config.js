/* browser-sync */
module.exports = {
  files: ['app/views', 'app/components', 'app/assets'],
  open: false,
  proxy: {
    target: 'localhost:8000',
    proxyReq: [(proxyReq) => proxyReq.setHeader('X-Forwarded-Host', 'localhost:3000')],
  },
}
