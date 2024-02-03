# db_config.py
import mysql.connector.pooling

db_config = {
    "host": "127.0.0.1",
    "user": "root",
    "password": "admin",
    "database": "db_bsc",
}

poolname = "MySqlPool1"
poolsize = 10

def create_db_handler():
    return mysql.connector.pooling.MySQLConnectionPool(
        pool_name=poolname, pool_size=poolsize, pool_reset_session=True, **db_config
    )
