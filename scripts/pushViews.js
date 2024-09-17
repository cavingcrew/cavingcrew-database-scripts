const mysql = require('mysql2/promise');
const fs = require('fs').promises;
const path = require('path');
const { Client } = require('ssh2');
const config = require('../config');

async function getViewFiles() {
  const dir = path.join(__dirname, '..', 'views');
  const files = await fs.readdir(dir);
  return files.filter(file => file.endsWith('.sql'));
}

async function readViewFile(filename) {
  const filePath = path.join(__dirname, '..', 'views', filename);
  return fs.readFile(filePath, 'utf8');
}

async function executeQuery(connection, query) {
  try {
    await connection.query(query);
    console.log(`Successfully executed: ${query.substring(0, 50)}...`);
  } catch (error) {
    console.error(`Error executing query: ${query.substring(0, 50)}...`);
    console.error(error);
    throw error;
  }
}

async function main() {
  const sshClient = new Client();
  
  sshClient.on('ready', async () => {
    console.log('SSH connection established');
    
    sshClient.forwardOut('127.0.0.1', 3306, '127.0.0.1', 3306, async (err, stream) => {
      if (err) throw err;
      
      const connection = await mysql.createConnection({
        ...config.db,
        stream
      });

      try {
        const viewFiles = await getViewFiles();
        
        for (const file of viewFiles) {
          const viewName = path.parse(file).name;
          const viewDefinition = await readViewFile(file);
          
          await executeQuery(connection, `DROP VIEW IF EXISTS \`${viewName}\``);
          await executeQuery(connection, viewDefinition);
          
          console.log(`View ${viewName} updated successfully.`);
        }
        
        console.log('All views have been pushed to the server.');
      } catch (error) {
        console.error('Error:', error);
      } finally {
        await connection.end();
        sshClient.end();
      }
    });
  }).connect(config.ssh);
}

main().catch(console.error);
