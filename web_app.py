from flask import Flask, request, jsonify, render_template
import os
import re
from dotenv import load_dotenv
from sql_executor import SQLExecutor
from pathlib import Path

app = Flask(__name__)

# Database configuration (you can modify these or load from environment variables)
DB_CONFIG = {
    "host": os.getenv("DB_HOST", "localhost"),
    "database": os.getenv("DB_NAME", "curso"),
    "user": os.getenv("DB_USER", "darwin"),
    "password": os.getenv("DB_PASSWORD", "$Para2109digma"),
    "port": int(os.getenv("DB_PORT", 3306))
}

# Load environment variables from .env file
from dotenv import load_dotenv
load_dotenv()

# Print configuration for debugging (remove in production)
print(f"DB Config: {DB_CONFIG}")

# Create SQL executor instance
sql_executor = SQLExecutor(DB_CONFIG)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/tests')
def tests():
    return render_template('tests.html')

@app.route('/quiz')
@app.route('/quiz/<int:quiz_number>')
def quiz(quiz_number=None):
    """Mostrar la página del quiz, opcionalmente con un número específico"""
    return render_template('quiz.html', quiz_number=quiz_number)

@app.route('/api/list-quizzes', methods=['GET'])
def list_quizzes():
    """Listar todos los quizzes disponibles en examples/"""
    try:
        examples_dir = Path(__file__).parent / 'examples'
        quizzes = []
        
        # Buscar todos los archivos quiz_dql_*.sql
        for file_path in examples_dir.glob('quiz_dql_*.sql'):
            # Extraer el número del nombre del archivo
            match = re.match(r'quiz_dql_(\d+)\.sql', file_path.name)
            if match:
                quiz_num = int(match.group(1))
                quizzes.append({
                    'number': quiz_num,
                    'filename': file_path.name,
                    'path': str(file_path)
                })
        
        # Ordenar por número
        quizzes.sort(key=lambda x: x['number'])
        
        return jsonify({"success": True, "quizzes": quizzes})
    except Exception as e:
        return jsonify({"success": False, "error": str(e)})

@app.route('/api/load-quiz', methods=['GET'])
def load_quiz():
    """Cargar las preguntas de quiz desde el archivo SQL"""
    try:
        # Obtener el número de quiz de la query string o usar el por defecto (6)
        quiz_number = request.args.get('quiz_number', '6')
        
        quiz_file = Path(__file__).parent / 'examples' / f'quiz_dql_{quiz_number}.sql'
        
        if not quiz_file.exists():
            return jsonify({
                "success": False, 
                "error": f"Quiz {quiz_number} no encontrado. Archivo: {quiz_file}"
            })
        
        with open(quiz_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Parsear el archivo para extraer preguntas y respuestas
        quiz_questions = parse_quiz_file(content)
        return jsonify({
            "success": True, 
            "questions": quiz_questions,
            "quiz_number": int(quiz_number)
        })
    except Exception as e:
        return jsonify({"success": False, "error": str(e)})

@app.route('/api/validate-quiz-answer', methods=['POST'])
def validate_quiz_answer():
    """Validar la respuesta del quiz"""
    try:
        data = request.get_json()
        question_id = data.get('question_id')
        user_answer = data.get('user_answer')
        quiz_number = data.get('quiz_number', '6')
        
        if question_id is None or user_answer is None:
            return jsonify({"success": False, "error": "Question ID and answer are required"})
        
        # Cargar las preguntas para encontrar la correcta
        quiz_file = Path(__file__).parent / 'examples' / f'quiz_dql_{quiz_number}.sql'
        
        if not quiz_file.exists():
            return jsonify({
                "success": False, 
                "error": f"Quiz {quiz_number} no encontrado"
            })
        
        with open(quiz_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        quiz_questions = parse_quiz_file(content)
        question = next((q for q in quiz_questions if q['id'] == question_id), None)
        
        if not question:
            return jsonify({"success": False, "error": "Question not found"})
        
        is_correct = user_answer.upper() == question['correct_answer'].upper()
        
        return jsonify({
            "success": True,
            "is_correct": is_correct,
            "correct_answer": question['correct_answer'],
            "theory": question.get('theory', ''),
            "sources": question.get('sources', []),
            "user_answer": user_answer
        })
        
    except Exception as e:
        return jsonify({"success": False, "error": str(e)})

def parse_quiz_file(content):
    """Parsear el archivo de quiz para extraer preguntas y respuestas"""
    questions = []
    lines = content.split('\n')
    current_question = {}
    
    for line in lines:
        line = line.strip()
        
        # Detectar inicio de nueva pregunta
        if line.startswith('-- QUIZ') and ':' in line:
            if current_question:
                questions.append(current_question)
            
            quiz_num = line.split(':')[0].split()[-1]
            current_question = {
                'id': int(quiz_num),
                'question': '',
                'options': [],
                'correct_answer': '',
                'level': 'básico' if int(quiz_num) <= 5 else 'intermedio' if int(quiz_num) <= 10 else 'avanzado' if int(quiz_num) <= 15 else 'experto'
            }
        
        # Detectar pregunta
        elif line.startswith('-- PREGUNTA:'):
            current_question['question'] = line.replace('-- PREGUNTA:', '').strip()
        
        # Detectar opciones
        elif line.startswith('-- OPCIONES:'):
            options_text = line.replace('-- OPCIONES:', '').strip()
            # Parsear opciones A) B) C) D)
            options = []
            for option in options_text.split(';'):
                option = option.strip()
                if option:
                    match = re.match(r'([A-D])\)\s*(.*)', option)
                    if match:
                        options.append({
                            'letter': match.group(1),
                            'text': match.group(2).strip()
                        })
            current_question['options'] = options
        
        # Detectar respuesta correcta
        elif line.startswith('-- RESPUESTA_CORRECTA:'):
            current_question['correct_answer'] = line.replace('-- RESPUESTA_CORRECTA:', '').strip()
        
        # Detectar teoría
        elif line.startswith('-- TEORIA:'):
            current_question['theory'] = line.replace('-- TEORIA:', '').strip()
        
        # Detectar fuentes
        elif line.startswith('-- FUENTES:'):
            sources_text = line.replace('-- FUENTES:', '').strip()
            current_question['sources'] = [source.strip() for source in sources_text.split('|')]
    
    # Añadir la última pregunta
    if current_question:
        questions.append(current_question)
    
    return questions

@app.route('/api/list-tests', methods=['GET'])
def list_tests():
    """Listar todos los tests disponibles en examples/"""
    try:
        examples_dir = Path(__file__).parent / 'examples'
        tests = []
        
        # Buscar todos los archivos test_dql_*.sql
        for file_path in examples_dir.glob('test_dql_*.sql'):
            # Extraer el número del nombre del archivo
            match = re.match(r'test_dql_(\d+)\.sql', file_path.name)
            if match:
                test_num = int(match.group(1))
                tests.append({
                    'number': test_num,
                    'filename': file_path.name,
                    'path': str(file_path)
                })
        
        # Ordenar por número
        tests.sort(key=lambda x: x['number'])
        
        return jsonify({"success": True, "tests": tests})
    except Exception as e:
        return jsonify({"success": False, "error": str(e)})

@app.route('/api/load-tests', methods=['GET'])
def load_tests():
    """Cargar las preguntas de test desde el archivo SQL"""
    try:
        # Obtener el número de test de la query string o usar el por defecto (1)
        test_number = request.args.get('test_number', '1')
        
        test_file = Path(__file__).parent / 'examples' / f'test_dql_{test_number}.sql'
        
        if not test_file.exists():
            return jsonify({
                "success": False, 
                "error": f"Test {test_number} no encontrado. Archivo: {test_file}"
            })
        
        with open(test_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Parsear el archivo para extraer preguntas y respuestas
        test_questions = parse_test_file(content)
        return jsonify({
            "success": True, 
            "questions": test_questions,
            "test_number": int(test_number)
        })
    except Exception as e:
        return jsonify({"success": False, "error": str(e)})

@app.route('/api/validate-answer', methods=['POST'])
def validate_answer():
    """Validar la respuesta del usuario"""
    try:
        data = request.get_json()
        user_query = data.get('query', '').strip()
        correct_answer = data.get('correct_answer', '').strip()
        test_number = data.get('test_number', '1')
        
        if not user_query or not correct_answer:
            return jsonify({"success": False, "error": "Query and answer cannot be empty"})
        
        # Normalizar ambas consultas para comparación
        normalized_user = normalize_sql(user_query)
        normalized_correct = normalize_sql(correct_answer)
        
        # Ejecutar la consulta del usuario para verificar que funciona
        user_result = sql_executor.execute_single_query(user_query)
        
        # Verificar si la consulta es sintácticamente correcta
        if not user_result.get("success", False):
            return jsonify({
                "success": False,
                "is_correct": False,
                "error": user_result.get("error", "Syntax error"),
                "user_query": user_query,
                "correct_answer": correct_answer
            })
        
        # Comparar las consultas normalizadas
        is_correct = normalized_user == normalized_correct
        
        return jsonify({
            "success": True,
            "is_correct": is_correct,
            "user_query": user_query,
            "correct_answer": correct_answer,
            "user_result": user_result.get("result", []),
            "normalized_user": normalized_user,
            "normalized_correct": normalized_correct
        })
        
    except Exception as e:
        return jsonify({"success": False, "error": str(e)})

def parse_test_file(content):
    """Parsear el archivo de tests para extraer preguntas y respuestas"""
    tests = []
    lines = content.split('\n')
    current_test = {}
    
    for line in lines:
        line = line.strip()
        
        # Detectar inicio de nuevo test
        if line.startswith('-- TEST') and ':' in line:
            if current_test:
                tests.append(current_test)
            
            test_num = line.split(':')[0].split()[-1]
            current_test = {
                'id': int(test_num),
                'question': '',
                'correct_answer': '',
                'level': 'básico' if int(test_num) <= 5 else 'intermedio' if int(test_num) <= 10 else 'avanzado' if int(test_num) <= 15 else 'desafío'
            }
        
        # Detectar pregunta
        elif line.startswith('-- PREGUNTA:'):
            current_test['question'] = line.replace('-- PREGUNTA:', '').strip()
        
        # Detectar respuesta correcta
        elif line.startswith('-- RESPUESTA CORRECTA:'):
            current_test['correct_answer'] = line.replace('-- RESPUESTA CORRECTA:', '').strip()
        
        # Detectar consulta SQL (línea que no es comentario)
        elif line and not line.startswith('--') and current_test.get('correct_answer'):
            # Si ya tenemos la respuesta, esta línea es la consulta SQL
            if not current_test.get('query'):
                current_test['query'] = line
    
    # Añadir el último test
    if current_test:
        tests.append(current_test)
    
    return tests

def normalize_sql(query):
    """Normalizar consulta SQL para comparación"""
    # Eliminar espacios extras, convertir a mayúsculas las palabras clave
    # y normalizar el formato para comparación
    
    # Eliminar comentarios y espacios múltiples
    normalized = re.sub(r'\s+', ' ', query.strip())
    
    # Convertir palabras clave SQL a mayúsculas
    sql_keywords = ['SELECT', 'FROM', 'WHERE', 'ORDER', 'BY', 'LIMIT', 'GROUP', 'HAVING', 
                   'JOIN', 'INNER', 'LEFT', 'RIGHT', 'ON', 'AS', 'AND', 'OR', 'NOT', 
                   'LIKE', 'BETWEEN', 'IN', 'IS', 'NULL', 'CASE', 'WHEN', 'THEN', 'ELSE', 'END',
                   'COUNT', 'SUM', 'AVG', 'MAX', 'MIN', 'DISTINCT', 'UNION', 'ALL']
    
    for keyword in sql_keywords:
        pattern = r'\b' + keyword + r'\b'
        normalized = re.sub(pattern, keyword.upper(), normalized, flags=re.IGNORECASE)
    
    # Eliminar espacios alrededor de paréntesis y operadores
    normalized = re.sub(r'\s*\(\s*', '(', normalized)
    normalized = re.sub(r'\s*\)\s*', ')', normalized)
    normalized = re.sub(r'\s*,\s*', ', ', normalized)
    normalized = re.sub(r'\s*=\s*', ' = ', normalized)
    normalized = re.sub(r'\s*>\s*', ' > ', normalized)
    normalized = re.sub(r'\s*<\s*', ' < ', normalized)
    
    # Limpiar espacios finales
    normalized = ' '.join(normalized.split())
    
    return normalized

@app.route('/api/execute-query', methods=['POST'])
def execute_query():
    try:
        data = request.get_json()
        query = data.get('query', '').strip()
        
        if not query:
            return jsonify({"success": False, "error": "Query cannot be empty"})
        
        print(f"Executing query: {query}")
        result = sql_executor.execute_single_query(query)
        print(f"Query result: {result}")
        return jsonify(result)
    except Exception as e:
        error_code = getattr(e, 'errno', 'UNKNOWN') if hasattr(e, 'errno') else 'UNKNOWN'
        print(f"❌ ERROR in execute_query (Code {error_code}): {str(e)}")
        
        # Mensajes de error específicos para el frontend
        error_message = str(e)
        if error_code == 1146:
            error_message = "La tabla especificada no existe en la base de datos"
        elif error_code == 1054:
            error_message = "Una de las columnas especificadas no existe"
        elif error_code == 1064:
            error_message = "Error de sintaxis en la consulta SQL"
        elif error_code == 1049:
            error_message = "La base de datos no existe"
        elif error_code == 1045:
            error_message = "Error de autenticación: credenciales incorrectas"
            
        return jsonify({"success": False, "error": error_message, "error_code": error_code})

@app.route('/api/execute-file', methods=['POST'])
def execute_file():
    try:
        data = request.get_json()
        file_content = data.get('file_content', '').strip()
        
        if not file_content:
            return jsonify({"success": False, "error": "File content cannot be empty"})
        
        print(f"Executing file with {len(file_content)} characters")
        
        # Use SQLFileReader to parse and execute queries
        from sql_executor import SQLFileReader
        queries = SQLFileReader.split_queries(file_content)
        results = []
        
        print(f"Found {len(queries)} queries to execute")
        
        for i, query in enumerate(queries):
            print(f"Executing query {i+1}: {query[:100]}...")
            result = sql_executor.execute_single_query(query)
            print(f"Query {i+1} result: {result}")
            results.append(result)
        
        return jsonify({
            "success": True,
            "results": results,
            "total_queries": len(queries)
        })
    except Exception as e:
        print(f"Error in execute_file: {str(e)}")
        return jsonify({"success": False, "error": str(e)})

@app.route('/api/test-connection', methods=['GET'])
def test_connection():
    try:
        print("Testing database connection...")
        result = sql_executor.execute_single_query("SELECT 1 as connection_test")
        print(f"Connection test result: {result}")
        if result["success"]:
            return jsonify({"success": True, "message": "Database connection successful"})
        else:
            return jsonify({"success": False, "error": result.get("error", "Connection test failed")})
    except Exception as e:
        print(f"Connection test error: {str(e)}")
        return jsonify({"success": False, "error": str(e)})

@app.teardown_appcontext
def teardown_db(exception):
    # Clean up database connections if needed
    pass

if __name__ == '__main__':
    # Create templates directory if it doesn't exist
    os.makedirs('templates', exist_ok=True)
    os.makedirs('static', exist_ok=True)
    
    app.run(debug=True, host='0.0.0.0', port=5000)
