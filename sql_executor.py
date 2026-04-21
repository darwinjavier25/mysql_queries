import mysql.connector
from mysql.connector import Error
from typing import List, Dict, Any, Optional
import os
from pathlib import Path


class MySQLConnection:
    def __init__(self, host: str, database: str, user: str, password: str, port: int = 3306):
        self.host = host
        self.database = database
        self.user = user
        self.password = password
        self.port = port
        self.connection = None
    
    def connect(self) -> bool:
        try:
            print(f"🔌 Connecting to MySQL: {self.user}@{self.host}:{self.port}/{self.database}")
            self.connection = mysql.connector.connect(
                host=self.host,
                database=self.database,
                user=self.user,
                password=self.password,
                port=self.port
            )
            print(f"✅ Connected to MySQL successfully")
            return True
        except Error as e:
            print(f"❌ ERROR connecting to MySQL: {e}")
            print(f"❌ Connection details: {self.user}@{self.host}:{self.port}/{self.database}")
            return False
    
    def disconnect(self):
        if self.connection and self.connection.is_connected():
            self.connection.close()
    
    def execute_query(self, query: str) -> List[Dict[str, Any]]:
        if not self.connection or not self.connection.is_connected():
            if not self.connect():
                return []
        
        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(query)
            
            if cursor.description:  # SELECT query
                result = cursor.fetchall()
                print(f"SELECT query executed: {len(result)} rows returned")
                if len(result) == 0:
                    # Analizar si es una búsqueda que podría tener resultados
                    query_lower = query.lower().strip()
                    if any(keyword in query_lower for keyword in ['where', 'having', 'limit']):
                        print(f"ℹ️  INFO: Query filter returned no results (this is normal). Query: {query}")
                    else:
                        print(f"⚠️  WARNING: Table appears to be empty. Query: {query}")
            else:  # INSERT, UPDATE, DELETE
                self.connection.commit()  # ¡IMPORTANTE! Hacer commit de los cambios
                affected = cursor.rowcount
                print(f"MODIFY query executed: {affected} rows affected. Query: {query}")
                result = [{"affected_rows": affected}]
            
            cursor.close()
            return result
        except Error as e:
            error_code = e.errno if hasattr(e, 'errno') else 'UNKNOWN'
            print(f"❌ ERROR executing query (Code {error_code}): {e}")
            print(f"❌ Failed query: {query}")
            
            # Errores específicos comunes
            error_message = str(e)
            if error_code == 1146:
                print(f"❌ TABLE DOES NOT EXIST: La tabla especificada no existe")
                error_message = "La tabla especificada no existe en la base de datos"
            elif error_code == 1054:
                print(f"❌ COLUMN DOES NOT EXIST: La columna especificada no existe")
                error_message = "Una de las columnas especificadas no existe"
            elif error_code == 1064:
                print(f"❌ SYNTAX ERROR: Error de sintaxis en la consulta SQL")
                error_message = "Error de sintaxis en la consulta SQL"
            elif error_code == 1049:
                print(f"❌ DATABASE DOES NOT EXIST: La base de datos no existe")
                error_message = "La base de datos no existe"
            elif error_code == 1045:
                print(f"❌ ACCESS DENIED: Credenciales incorrectas o permisos insuficientes")
                error_message = "Error de autenticación: credenciales incorrectas"
            
            if self.connection:
                self.connection.rollback()  # Rollback en caso de error
                print("❌ Transaction rolled back")
            
            # Devolver objeto de error en lugar de lista vacía
            return {
                "success": False,
                "error": error_message,
                "error_code": error_code,
                "query": query
            }


class SQLFileReader:
    @staticmethod
    def read_sql_file(file_path: str) -> str:
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                return file.read()
        except FileNotFoundError:
            print(f"SQL file not found: {file_path}")
            return ""
        except Exception as e:
            print(f"Error reading SQL file: {e}")
            return ""
    
    @staticmethod
    def split_queries(sql_content: str) -> List[str]:
        queries = []
        current_query = ""
        
        for line in sql_content.split('\n'):
            line = line.strip()
            if not line or line.startswith('--') or line.startswith('#'):
                continue
            
            current_query += line + " "
            
            if line.endswith(';'):
                queries.append(current_query.strip())
                current_query = ""
        
        if current_query.strip():
            queries.append(current_query.strip())
        
        return [q for q in queries if q]


class SQLExecutor:
    def __init__(self, db_config: Dict[str, Any]):
        self.db_connection = MySQLConnection(**db_config)
    
    def execute_from_file(self, file_path: str) -> Dict[str, Any]:
        sql_content = SQLFileReader.read_sql_file(file_path)
        if not sql_content:
            return {"success": False, "error": "Could not read SQL file"}
        
        queries = SQLFileReader.split_queries(sql_content)
        results = []
        
        for query in queries:
            result = self.db_connection.execute_query(query)
            results.append({
                "query": query,
                "result": result,
                "success": True
            })
        
        return {
            "success": True,
            "results": results,
            "total_queries": len(queries)
        }
    
    def execute_single_query(self, query: str) -> Dict[str, Any]:
        try:
            result = self.db_connection.execute_query(query)
            
            # Verificar si el resultado es un objeto de error
            if isinstance(result, dict) and not result.get("success", True):
                return result
            
            return {
                "success": True,
                "result": result,
                "query": query
            }
        except Exception as e:
            return {
                "success": False,
                "error": str(e),
                "query": query
            }
    
    def close(self):
        self.db_connection.disconnect()


if __name__ == "__main__":
    # Example usage
    db_config = {
        "host": "localhost",
        "database": "curso",
        "user": "darwin",
        "password": "$Para2109digma",
        "port": 3306
    }
    
    executor = SQLExecutor(db_config)
    
    # Execute single query
    result = executor.execute_single_query("SELECT 1 as test")
    print(result)
    
    # Execute from file
    # result = executor.execute_from_file("example.sql")
    # print(result)
    
    executor.close()
