const mysql = require('mysql2/promise');
const fs = require('fs').promises;
const path = require('path');
const { Client } = require('ssh2');
const config = require('../config');
const { pullViews } = require('./pullViews');

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

async function deleteFile(filePath) {
  try {
    await fs.unlink(filePath);
    console.log(`File deleted successfully: ${filePath}`);
  } catch (error) {
    console.error(`Error deleting file: ${filePath}`);
    console.error(error);
  }
}

async function main() {
  const sshClient = new Client();
  
  sshClient.on('ready', async () => {
    console.log('SSH connection established');
    
    sshClient.forwardOut('127.0.0.1', 3306, '127.0.0.1', 3306, async (err, stream) => {
      if (err) throw err;
      
      const dbPassword = await config.getDbPassword();
      const connection = await mysql.createConnection({
        ...config.db,
        password: dbPassword,
        stream
      });

      try {
        const viewFiles = await getViewFiles();
        
        for (const file of viewFiles) {
          const viewName = path.parse(file).name;
          const viewDefinition = await readViewFile(file);
          const filePath = path.join(__dirname, '..', 'views', file);
          
          if (viewDefinition.trim().toLowerCase() === `drop view ${viewName}`) {
            await executeQuery(connection, `DROP VIEW IF EXISTS \`${viewName}\``);
            console.log(`View ${viewName} dropped successfully.`);
            await deleteFile(filePath);
          } else {
            await executeQuery(connection, `DROP VIEW IF EXISTS \`${viewName}\``);
            await executeQuery(connection, viewDefinition);
            console.log(`View ${viewName} updated successfully.`);
          }
        }
        
        console.log('All views have been processed.');
        
        // Execute pullViews after successful push
        console.log('Executing pull operation to ensure synchronization...');
        await pullViews();
        
      } catch (error) {
        console.error('Error:', error);
      } finally {
        await connection.end();
        sshClient.end();
      }
    });
  }).connect(config.ssh);
}

if (require.main === module) {
  main().catch(console.error);
}

module.exports = { pushViews: main };
