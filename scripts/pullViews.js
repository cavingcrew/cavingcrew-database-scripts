require('dotenv').config();
const mysql = require('mysql2/promise');
const fs = require('fs').promises;
const path = require('path');
const { Client } = require('ssh2');

const sshConfig = {
  host: 'cavingcrew',
  username: 'bitnami',
  privateKey: require('fs').readFileSync('/path/to/your/private/key')
};

const dbConfig = {
  host: 'localhost',
  user: 'root',
  password: process.env.DB_PASSWORD,
  database: 'jtl_cavingcrew_com'
};

async function getViews(connection) {
  const [rows] = await connection.query('SHOW FULL TABLES WHERE Table_type = "VIEW"');
  return rows.map(row => Object.values(row)[0]);
}

async function getViewDefinition(connection, viewName) {
  const [rows] = await connection.query(`SHOW CREATE VIEW \`${viewName}\``);
  return rows[0]['Create View'];
}

async function saveViewToFile(viewName, definition) {
  const dir = path.join(__dirname, '..', 'views');
  await fs.mkdir(dir, { recursive: true });
  await fs.writeFile(path.join(dir, `${viewName}.sql`), definition);
}

async function main() {
  const sshClient = new Client();
  
  sshClient.on('ready', async () => {
    console.log('SSH connection established');
    
    sshClient.forwardOut('127.0.0.1', 3306, '127.0.0.1', 3306, async (err, stream) => {
      if (err) throw err;
      
      const connection = await mysql.createConnection({
        ...dbConfig,
        stream
      });

      try {
        const views = await getViews(connection);
        
        for (const view of views) {
          const definition = await getViewDefinition(connection, view);
          await saveViewToFile(view, definition);
          console.log(`Saved view: ${view}`);
        }
        
        console.log('All views have been pulled and saved.');
      } catch (error) {
        console.error('Error:', error);
      } finally {
        await connection.end();
        sshClient.end();
      }
    });
  }).connect(sshConfig);
}

main().catch(console.error);
