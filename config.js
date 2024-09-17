require('dotenv').config();

module.exports = {
  ssh: {
    host: 'ssh.cavingcrew.com',
    username: 'bitnami',
    privateKey: require('fs').readFileSync('~/.ssh/traginew'),
    compression: true,
    serverAliveInterval: 60,
    forwardX11: true
  },
  db: {
    host: 'localhost',
    user: 'root',
    password: process.env.DB_PASSWORD,
    database: 'jtl_cavingcrew_com'
  }
};
